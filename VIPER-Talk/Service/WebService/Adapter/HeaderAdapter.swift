//
//  HeaderAdapter.swift
//  VIPER-Talk
//
//  Created by Nick on 5/12/20.
//  Copyright © 2020 co.Kcin.Nil. All rights reserved.
//

import Foundation

public
struct HeaderAdapter: Adapter {
    let data: [String: String]?
    
    public
    func apply(_ request: URLRequest) throws -> URLRequest {
        guard let data = data else { return request }
        var request = request
        for (key, value) in data {
            request.addValue(value, forHTTPHeaderField: key)
        }
        return request
    }
}
