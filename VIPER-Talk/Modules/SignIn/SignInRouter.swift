//
//  SignInRouter.swift
//  VIPER-Talk
//
//  Created by Nick on 5/13/20.
//  Copyright © 2020 co.Kcin.Nil. All rights reserved.
//

import UIKit

final class SignInRouter {
    
    unowned var viewController: UIViewController
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }

    static func createModule() -> UIViewController {
        let view: SignInViewController = SignInViewController()
        let interactor: SignInInteractor = SignInInteractor()
        let router: SignInRouter = SignInRouter(viewController: view)
        let presenter: SignInPresenter = SignInPresenter(view: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        interactor.webService = WebService.shared
        router.viewController = view
        
        return view
    }
}

// Presenter -> Router
extension SignInRouter: SignInRouterProtocol {

    func changeToHomeModule() {
        guard let nav = viewController.navigationController else {
            assertionFailure("can't got navigationController, please check.")
            return
        }
        let homeModule = HomeRouter.createModule()
        nav.setViewControllers([homeModule], animated: true)
    }
    
}
