//
//  SignUpRouter.swift
//  VIPER-Talk
//
//  Created by Nick on 5/19/20.
//  Copyright © 2020 co.Kcin.Nil. All rights reserved.
//

import Foundation

final class SignUpRouter {
    
    private unowned var view: SignUpViewProtocol

    init(view: SignUpViewProtocol) {
        self.view = view
    }

}

// Presenter -> Router
extension SignUpRouter: SignUpRouterProtocol {

    func changeToHome() {
     
        guard let nav = view.navigationController else {
            assertionFailure("got nav failure")
            return
        }
        let home = HomeModule.build()
        nav.setViewControllers([home], animated: true)
    }
    
}
