//
//  WebService.swift
//  VIPER-Talk
//
//  Created by Nick on 5/14/20.
//  Copyright © 2020 co.Kcin.Nil. All rights reserved.
//

import Foundation

final class WebService {
    typealias ModelSuccessClosure<Model: Codable> = (Model) -> Void
    typealias EmptySuccessClosure = () -> Void
    typealias ErrorClosure = (Error?) -> Void
    
    static let shared: WebService = WebService()
    
    private init() {}
    
    func signIn(name: String,
                password: String,
                success: EmptySuccessClosure?,
                failure: ErrorClosure?) {
        
        DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
            if Int64(Date().timeIntervalSince1970) % 2 == 0 {
                success?()
            } else {
                failure?(ApiError.userNotFound)
            }
        }
        
    }
    
}

enum ApiError: Swift.Error {
    case userNotFound
}

extension ApiError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .userNotFound:
            return "can't find user, please check your username and password."
        }
    }
}
