//
//  SignInPresenter.swift
//  VIPER-Talk
//
//  Created by Nick on 5/13/20.
//  Copyright © 2020 co.Kcin.Nil. All rights reserved.
//

import Foundation

final class SignInPresenter {
    
    private unowned var view: SignInPresenterToViewProtocol!
    private let interactor: SignInPresenterToInteractorProtocol
    private let router: SignInPresenterToRouterProtocol
    
    init(view: SignInPresenterToViewProtocol,
         interactor: SignInPresenterToInteractorProtocol,
         router: SignInPresenterToRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
        
}

// View -> Presenter
extension SignInPresenter: SignInViewToPresenterProtocol {
    
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
extension SignInPresenter: SignInInteractorToPresenterProtocol {
    
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
