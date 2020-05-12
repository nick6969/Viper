//
//  DecodeJSONResultDecision.swift
//  VIPER-Talk
//
//  Created by Nick on 5/12/20.
//  Copyright © 2020 co.Kcin.Nil. All rights reserved.
//

import Foundation

public
struct DecodeJSONResultDecision: Decision {
    let decoder: JSONDecoder
    
    init(decoder: JSONDecoder = JSONDecoder()) {
        self.decoder = decoder
    }
    
    public
    func shouldApply<Req>(request: Req, data: Data, response: HTTPURLResponse) -> Bool where Req: Request {
        return true
    }
    
    public
    func apply<Req>(request: Req,
                    data: Data,
                    response: HTTPURLResponse,
                    done closure: @escaping (DecisionAction<Req>) -> Void) where Req: Request {
        do {
            let value = try decoder.decode(Req.Response.self, from: data)
            closure(.done(value))
        } catch {
            closure(.errored(error))
        }
    }
    
}
