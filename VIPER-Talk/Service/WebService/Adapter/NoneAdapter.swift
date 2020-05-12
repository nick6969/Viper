//
//  NoneAdapter.swift
//  VIPER-Talk
//
//  Created by Nick on 5/12/20.
//  Copyright © 2020 co.Kcin.Nil. All rights reserved.
//

import Foundation

public
struct NoneAdapter: Adapter {
    public
    func apply(_ request: URLRequest) throws -> URLRequest {
        return request
    }
}
