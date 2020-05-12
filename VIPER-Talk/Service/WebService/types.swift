//
//  types.swift
//  VIPER-Talk
//
//  Created by Nick on 5/12/20.
//  Copyright © 2020 co.Kcin.Nil. All rights reserved.
//

import Foundation

public
enum DecisionAction<Req: Request> {
    case next(Data, HTTPURLResponse)
    case restart([Decision])
    case errored(Error)
    case done(Req.Response)
}

public
enum Method: String {
    case head = "HEAD"
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

public
enum ContentType {
    case json
    case formURL
    case none
    
    public
    func adapter(for data: [String: Any]) -> Adapter {
        switch self {
        case .json: return JSONRequestAdapter(data: data)
        case .formURL: return FormURLAdapter(data: data)
        case .none: return NoneAdapter()
        }
    }
}
