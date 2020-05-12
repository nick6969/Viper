//
//  QueryAdapter.swift
//  VIPER-Talk
//
//  Created by Nick on 5/12/20.
//  Copyright © 2020 co.Kcin.Nil. All rights reserved.
//

import Foundation

public
struct QueryAdapter: Adapter {
    let url: URL
    let data: [String: String]?
    
    public
    func apply(_ request: URLRequest) throws -> URLRequest {
        guard let data = data else { return request }
        guard var urlComponent = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
            throw QueryError.urlNotCorrect
        }
        urlComponent.queryItems = data.map { URLQueryItem(name: $0.key, value: $0.value) }
        guard let newUrl = urlComponent.url else {
            throw QueryError.queryItemError
        }
        
        var request = request
        request.url = newUrl
        return request
    }
}
