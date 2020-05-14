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

    func signIn(name: String, password: String) {

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
