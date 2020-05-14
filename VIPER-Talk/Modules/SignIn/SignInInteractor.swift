//
//  SignInInteractor.swift
//  VIPER-Talk
//
//  Created by Nick on 5/13/20.
//  Copyright © 2020 co.Kcin.Nil. All rights reserved.
//

import Foundation

final class SignInInteractor {
    
    var presenter: SignInOutputInteractorProtocol?
    
}

// Presenter -> Interactor
extension SignInInteractor: SignInInputInteractorProtocol {

    func signIn(name: String?, password: String?) {

        guard let name = name, let password = password else {
            self.presenter?.signInFailure(error: SignInError.inputEmpty)
            return
        }
        
        guard name.validate(with: .username) else {
            self.presenter?.signInFailure(error: SignInError.usernameNoCorrect)
            return
        }
        
        guard password.validate(with: .password) else {
            self.presenter?.signInFailure(error: SignInError.passwordNoCorrect)
            return
        }
        
        WebService.shared.signIn(name: name, password: password, success: { [weak self] in
            DispatchQueue.main.async {
                self?.presenter?.signInSuccess()
            }
        }, failure: { [weak self] error in
            DispatchQueue.main.async {
                self?.presenter?.signInFailure(error: error)
            }
        })

    }

}

enum SignInError: Swift.Error {
    case inputEmpty
    case usernameNoCorrect
    case passwordNoCorrect
}

extension SignInError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .inputEmpty:
            return "input info is empty."
        case .usernameNoCorrect:
            return "input username noCorrect."
        case .passwordNoCorrect:
            return "input password noCorrect."
        }
    }
}
