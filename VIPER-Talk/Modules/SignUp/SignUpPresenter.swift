//
//  SignUpPresenter.swift
//  VIPER-Talk
//
//  Created by Nick on 5/13/20.
//  Copyright © 2020 co.Kcin.Nil. All rights reserved.
//

import Foundation

final class SignUpPresenter: SignUpPresenterProtocol {
    
    private weak var view: SignUpViewProtocol?
    var interactor: SignUpInputInteractorProtocol?
    private let router: SignUpRouterProtocol
    
    init(view: SignUpViewProtocol, interactor: SignUpInputInteractorProtocol, router: SignUpRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension SignUpPresenter: SignUpOutputInteractorProtocol {
    // Interactor -> Presenter
}
