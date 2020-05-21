//
//  SignUpPresenter.swift
//  VIPER-Talk
//
//  Created by Nick on 5/19/20.
//  Copyright © 2020 co.Kcin.Nil. All rights reserved.
//

import Foundation

final class SignUpPresenter {
    
    private unowned var view: SignUpPresenterToViewProtocol!
    private let interactor: SignUpPresenterToInteractorProtocol
    private let router: SignUpPresenterToRouterProtocol
    
    init(view: SignUpPresenterToViewProtocol,
         interactor: SignUpPresenterToInteractorProtocol,
         router: SignUpPresenterToRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

// View -> Presenter
extension SignUpPresenter: SignUpViewToPresenterProtocol {
    
    func check(username: String?, password: String?) {
        let enabled = interactor.check(username: username, password: password)
        view?.checkSendButton(enabled: enabled)
    }
    
    func send(username: String?, password: String?) {
        view?.showLoading()
        interactor.send(username: username, password: password)
    }
    
}

// Interactor -> Presenter
extension SignUpPresenter: SignUpInteractorToPresenterProtocol {
    
    func signUpSuccess() {
        view?.dismissLoading()
        router.changeToHome()
    }
    
    func signUpFailure(error: Error?) {
        let message = error?.localizedDescription ?? "Failure"
        view?.dismissLoading()
        view?.showMessage(message)
    }

}
