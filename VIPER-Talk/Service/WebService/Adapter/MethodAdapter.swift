//
//  MethodAdapter.swift
//  VIPER-Talk
//
//  Created by Nick on 5/12/20.
//  Copyright © 2020 co.Kcin.Nil. All rights reserved.
//

import Foundation

public
struct MethodAdapter: Adapter {
    let method: Method
    
    public
    func apply(_ request: URLRequest) throws -> URLRequest {
        var request = request
        request.httpMethod = self.method.rawValue
        return request
    }
    
}
