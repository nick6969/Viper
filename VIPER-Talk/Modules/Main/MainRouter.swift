//
//  MainRouter.swift
//  VIPER-Talk
//
//  Created by Nick on 5/14/20.
//  Copyright © 2020 co.Kcin.Nil. All rights reserved.
//

import UIKit

final class MainRouter {
    
    private unowned var view: MainViewProtocol

    init(view: MainViewProtocol) {
        self.view = view
    }

    static func createModule() -> MainViewProtocol {
        let view: MainViewController = MainViewController()
        let interactor: MainInteractor = MainInteractor()
        let router: MainRouter = MainRouter(view: view)
        let presenter: MainPresenter = MainPresenter(view: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        
        return view
    }
}

// Presenter -> Router
extension MainRouter: MainRouterProtocol {

    func pushToSignIn() {
        guard let nav = view.navigationController else {
            assertionFailure("can't got navigationController, please check.")
            return
        }
        let signInModule = SignInRouter.createModule()
        nav.pushViewController(signInModule, animated: true)
    }
    
    func pushToSignUp() {
        guard let nav = view.navigationController else {
            assertionFailure("can't got navigationController, please check.")
            return
        }
        
        let signUpModule = SignUpRouter.createModule()
        nav.pushViewController(signUpModule, animated: true)
    }

}
