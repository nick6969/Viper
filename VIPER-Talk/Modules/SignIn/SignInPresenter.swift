//
//  SignInPresenter.swift
//  VIPER-Talk
//
//  Created by Nick on 5/13/20.
//  Copyright © 2020 co.Kcin.Nil. All rights reserved.
//

import Foundation

final class SignInPresenter {
    
    private weak var view: SignInViewProtocol?
    private let interactor: SignInInputInteractorProtocol
    private let router: SignInRouterProtocol
    
    init(view: SignInViewProtocol, interactor: SignInInputInteractorProtocol, router: SignInRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
        
}

// View -> Presenter
extension SignInPresenter: SignInPresenterProtocol {
    
    func confirm(name: String?, password: String?) {
        guard let name = name, let password = password else {
            view?.showError(message: ErrorMessage.signIn001)
            return
        }
        guard name.validate(with: .username) else {
            view?.showError(message: ErrorMessage.signIn002)
            return
        }
        
        guard password.validate(with: .password) else {
            view?.showError(message: ErrorMessage.signIn003)
            return
        }
        
        view?.showLoading()
        
        interactor.signIn(name: name, password: password)
    }

}

// Interactor -> Presenter
extension SignInPresenter: SignInOutputInteractorProtocol {
    
    func signInSuccess() {
        view?.dismissLoading()
        router.changeToHomeModule()
    }
    
    func signInFailure(error: Error?) {
        let message: String = error?.localizedDescription ?? "unKnow Error."
        view?.dismissLoading()
        view?.showError(message: message)
    }

}
