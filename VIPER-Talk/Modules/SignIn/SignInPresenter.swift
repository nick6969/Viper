//
//  SignInPresenter.swift
//  VIPER-Talk
//
//  Created by Nick on 5/13/20.
//  Copyright © 2020 co.Kcin.Nil. All rights reserved.
//

import Foundation

final class SignInPresenter: SignInPresenterProtocol {
    
    private weak var view: SignInViewProtocol?
    var interactor: SignInInputInteractorProtocol?
    private let router: SignInRouterProtocol
    
    init(view: SignInViewProtocol, interactor: SignInInputInteractorProtocol, router: SignInRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension SignInPresenter: SignInOutputInteractorProtocol {
    // Interactor -> Presenter
}
