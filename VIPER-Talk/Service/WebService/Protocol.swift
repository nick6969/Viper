//
//  Protocol.swift
//  VIPER-Talk
//
//  Created by Nick on 5/12/20.
//  Copyright © 2020 co.Kcin.Nil. All rights reserved.
//

import Foundation

public
protocol Adapter {
    func apply(_ request: URLRequest) throws -> URLRequest
}

public
protocol Decision {
    func shouldApply<Req: Request>(request: Req,
                                   data: Data,
                                   response: HTTPURLResponse) -> Bool
    func apply<Req: Request>(request: Req,
                             data: Data,
                             response: HTTPURLResponse,
                             done closure: @escaping (DecisionAction<Req>) -> Void)
}

public
protocol Session {
        
    func dataTask(with request: URLRequest,
                  completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
    
}

public
protocol Request {
    
    associatedtype Response: Decodable
    
    var url: URL { get }
    var method: Method { get }
    var contentType: ContentType { get }
    var content: [String: Any] { get }
    var headers: [String: String]? { get }
    var query: [String: String]? { get }
    
    var adapters: [Adapter] { get }
    var decisions: [Decision] { get }
}

public
protocol PluginType {
    typealias ResultType = (Data?, URLResponse?, Error?)
    func willSend<Req: Request>(request: Req, urlRequest: URLRequest)
    func didReceive<Req: Request>(request: Req, result: ResultType)
}

extension URLSession: Session {}

extension Request {
    
    // setup default value
    var method: Method { .get }
    var contentType: ContentType { .json }
    var content: [String: Any] { [:] }
    var headers: [String: String]? { nil }
    var query: [String: String]? { nil }
    
    // this is build the request use
    var defaultAdapter: [Adapter] {
        return [
            QueryAdapter(url: url, data: query),
            HeaderAdapter(data: headers),
            ContentAdapter(method: method, contentType: contentType, content: content)
        ]
    }
    
    // this is default decisions, retry and check status and convert data to model
    var defaultDecisions: [Decision] {
        return [
            RetryDecision(retryCount: 2),
            StatusCodeDecision(),
            DecodeJSONResultDecision()
        ]
    }
    
    // if customer adapters, remember use defaultAdapter
    var adapters: [Adapter] { defaultAdapter }
    
    // using defaultDecisions to convert data to response model, can customer by your self
    var decisions: [Decision] { defaultDecisions }
    
    // this method will build the url request
    func buildRequest() throws -> URLRequest {
        var request = URLRequest(url: url)
        request = try MethodAdapter(method: method).apply(request)
        return try adapters.reduce(request) { try $1.apply($0) }
    }
    
}
