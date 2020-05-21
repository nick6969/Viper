//
//  MainRouter.swift
//  VIPER-Talk
//
//  Created by Nick on 5/14/20.
//  Copyright © 2020 co.Kcin.Nil. All rights reserved.
//

import Foundation

final class MainRouter {
    
    private unowned var view: MainPresenterToViewProtocol

    init(view: MainPresenterToViewProtocol) {
        self.view = view
    }

}

// Presenter -> Router
extension MainRouter: MainPresenterToRouterProtocol {

    func pushToSignIn() {
        guard let nav = view.navigationController else {
            assertionFailure("can't got navigationController, please check.")
            return
        }
        let signInModule = SignInModule.build()
        nav.pushViewController(signInModule, animated: true)
    }
    
    func pushToSignUp() {
        guard let nav = view.navigationController else {
            assertionFailure("can't got navigationController, please check.")
            return
        }
        
        let signUpModule = SignUpModule.build()
        nav.pushViewController(signUpModule, animated: true)
    }

}
