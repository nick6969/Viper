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
        // TODO: - Call Api
    }

}
