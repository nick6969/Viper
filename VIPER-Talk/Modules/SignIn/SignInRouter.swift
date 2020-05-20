//
//  SignInRouter.swift
//  VIPER-Talk
//
//  Created by Nick on 5/13/20.
//  Copyright © 2020 co.Kcin.Nil. All rights reserved.
//

import UIKit

final class SignInRouter {
        
    private unowned var view: SignInViewProtocol

    init(view: SignInViewProtocol) {
        self.view = view
    }

    static func createModule() -> SignInViewProtocol {
        let view: SignInViewController = SignInViewController()
        let interactor: SignInInteractor = SignInInteractor()
        let router: SignInRouter = SignInRouter(view: view)
        let presenter: SignInPresenter = SignInPresenter(view: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        interactor.webService = WebService.shared
        
        return view
    }
}

// Presenter -> Router
extension SignInRouter: SignInRouterProtocol {

    func changeToHomeModule() {
        guard let nav = view.navigationController else {
            assertionFailure("can't got navigationController, please check.")
            return
        }
        let homeModule = HomeRouter.createModule()
        nav.setViewControllers([homeModule], animated: true)
    }
    
}
