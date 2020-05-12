//
//  StatusCodeDecision.swift
//  VIPER-Talk
//
//  Created by Nick on 5/12/20.
//  Copyright © 2020 co.Kcin.Nil. All rights reserved.
//

import Foundation

public
struct StatusCodeDecision: Decision {
    
    public
    func shouldApply<Req>(request: Req, data: Data, response: HTTPURLResponse) -> Bool where Req: Request {
        return !(200..<300).contains(response.statusCode)
    }
    
    public
    func apply<Req>(request: Req,
                    data: Data,
                    response: HTTPURLResponse,
                    done closure: @escaping (DecisionAction<Req>) -> Void) where Req: Request {
        closure(.errored(ResponseError.apiError(statusCode: response.statusCode, body: data)))
    }
    
}
