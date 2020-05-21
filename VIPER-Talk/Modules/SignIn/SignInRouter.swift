//
//  SignInRouter.swift
//  VIPER-Talk
//
//  Created by Nick on 5/13/20.
//  Copyright © 2020 co.Kcin.Nil. All rights reserved.
//

import Foundation

final class SignInRouter {
        
    private unowned var view: SignInPresenterToViewProtocol

    init(view: SignInPresenterToViewProtocol) {
        self.view = view
    }

}

// Presenter -> Router
extension SignInRouter: SignInPresenterToRouterProtocol {

    func changeToHomeModule() {
        guard let nav = view.navigationController else {
            assertionFailure("can't got navigationController, please check.")
            return
        }
        let homeModule = HomeModule.build()
        nav.setViewControllers([homeModule], animated: true)
    }
    
}
