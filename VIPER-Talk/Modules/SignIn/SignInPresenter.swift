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
    
    func send(name: String?, password: String?) {
        view?.showLoading()
        interactor.signIn(name: name, password: password)
    }
    
    func check(name: String?, password: String?) {
        let enabled = interactor.check(name: name, password: password)
        view?.sendButtonStatus(enabled: enabled)
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
        view?.showMessage(message)
    }

}
