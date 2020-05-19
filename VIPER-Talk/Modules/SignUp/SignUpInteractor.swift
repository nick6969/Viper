//
//  SignUpInteractor.swift
//  VIPER-Talk
//
//  Created by Nick on 5/19/20.
//  Copyright © 2020 co.Kcin.Nil. All rights reserved.
//

import Foundation

final class SignUpInteractor {
    
    var presenter: SignUpOutputInteractorProtocol?
    var webService: SignUpWebServiceProtocol?

}

// Presenter -> Interactor
extension SignUpInteractor: SignUpInputInteractorProtocol {
    
    func check(username: String?, password: String?) -> Bool {
        guard
            let name = username,
            let password = password,
            name.validate(with: .username),
            password.validate(with: .password)
        else {
            return false
        }
        return true
    }
    
    func send(username: String?, password: String?) {
        
        guard let name = username, let password = password else {
            self.presenter?.signUpFailure(error: SignInError.inputEmpty)
            return
        }
        
        guard name.validate(with: .username) else {
            self.presenter?.signUpFailure(error: SignInError.usernameNoCorrect)
            return
        }
        
        guard password.validate(with: .password) else {
            self.presenter?.signUpFailure(error: SignInError.passwordNoCorrect)
            return
        }
        
        webService?.signUp(name: name, password: password, success: { [weak self] in
            
            DispatchQueue.main.async {
                self?.presenter?.signUpSuccess()
            }
            
        }, failure: {[weak self] error in
            
            DispatchQueue.main.async {
                self?.presenter?.signUpFailure(error: error)
            }
            
        })
    }

}
