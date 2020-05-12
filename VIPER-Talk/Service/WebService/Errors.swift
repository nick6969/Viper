//
//  Errors.swift
//  VIPER-Talk
//
//  Created by Nick on 5/12/20.
//  Copyright © 2020 co.Kcin.Nil. All rights reserved.
//

import Foundation

public
enum QueryError: Error {
    case urlNotCorrect
    case queryItemError
    case methodNotSetup
}

public
enum ResponseError: Error {
    case nilData
    case nonHTTPResponse
    case apiError(statusCode: Int, body: Data)
}

public
enum FlowError: Error {
    case decisionsEmpty
}
