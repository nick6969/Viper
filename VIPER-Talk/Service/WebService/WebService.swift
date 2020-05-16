//
//  WebService.swift
//  VIPER-Talk
//
//  Created by Nick on 5/14/20.
//  Copyright © 2020 co.Kcin.Nil. All rights reserved.
//

import Foundation

typealias ModelSuccessClosure<Model: Codable> = (Model) -> Void
typealias EmptySuccessClosure = () -> Void
typealias ErrorClosure = (Error?) -> Void

final class WebService {
    
    static let shared: WebService = WebService()
    
    private init() {}
    
}

extension WebService: SignInWebServiceProtocol {
    
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

extension WebService: CategoryWebServiceProtocol {
    
    func getCategoryWith(id: String, success: ModelSuccessClosure<[BranchModel]>?, failure: ErrorClosure?) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
            do {
                let dic = try self.getDic(name: "category")
                guard let key = dic[id] as? [String: Any], let array = key["data"] as? [Any] else {
                    failure?(ApiError.fileContentNoCorrect)
                    return
                }
                let models = try self.arrayToModel(array: array)
                success?(models)
            } catch {
                failure?(error)
            }
        }
    }
    
}

extension WebService {

    func signUp(name: String,
                password: String,
                success: EmptySuccessClosure?,
                failure: ErrorClosure?) {
        
        DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
            if Int64(Date().timeIntervalSince1970) % 2 == 0 {
                success?()
            } else {
                failure?(ApiError.userNameDuplicate)
            }
        }
        
    }
    
    func getBranch(success: ModelSuccessClosure<[BranchModel]>?, failure: ErrorClosure?) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
            do {
                let dic = try self.getDic(name: "branch")
                guard let array = dic["data"] as? [Any] else {
                    failure?(ApiError.fileContentNoCorrect)
                    return
                }
                let models = try self.arrayToModel(array: array)
                success?(models)
            } catch {
                failure?(error)
            }
        }
    }
    
    func getSmallCategoryWith(id: String, success: ModelSuccessClosure<[BranchModel]>?, failure: ErrorClosure?) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
            do {
                let dic = try self.getDic(name: "smallCategory")
                guard let key = dic[id] as? [String: Any], let array = key["data"] as? [Any] else {
                    failure?(ApiError.fileContentNoCorrect)
                    return
                }
                let models = try self.arrayToModel(array: array)
                success?(models)
            } catch {
                failure?(error)
            }
        }
    }
}

extension WebService {
    private
    func getDic(name: String) throws -> [String: Any] {
        guard let fileUrl = Bundle.main.url(forResource: name, withExtension: "json") else {
            throw ApiError.loadFileError
        }
        let json = try Data(contentsOf: fileUrl)
        guard let dic = try JSONSerialization.jsonObject(with: json, options: .mutableContainers) as? [String: Any] else {
            throw ApiError.fileContentNoCorrect
        }
        return dic
    }
    
    private
    func arrayToModel(array: [Any]) throws -> [BranchModel] {
        let data = try JSONSerialization.data(withJSONObject: array, options: .prettyPrinted)
        let models = try JSONDecoder().decode([BranchModel].self, from: data)
        return models
    }
}

struct BranchModel: Codable {
    let id: String
    let name: String
}

enum ApiError: Swift.Error {
    case userNotFound
    case userNameDuplicate
    case loadFileError
    case fileContentNoCorrect
}

extension ApiError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .userNotFound:
            return "can't find user, please check your username and password."
        case .userNameDuplicate:
            return "username is duplicate, please choose other one."
        case .loadFileError:
            return "can't find json file."
        case .fileContentNoCorrect:
            return "file content is not correct."
        }
    }
}
