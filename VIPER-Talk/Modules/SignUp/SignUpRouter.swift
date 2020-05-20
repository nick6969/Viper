//
//  SignUpRouter.swift
//  VIPER-Talk
//
//  Created by Nick on 5/19/20.
//  Copyright © 2020 co.Kcin.Nil. All rights reserved.
//

import UIKit

final class SignUpRouter {
    
    unowned var viewController: UIViewController
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }

    static func createModule() -> UIViewController {
        let view: SignUpViewController = SignUpViewController()
        let interactor: SignUpInteractor = SignUpInteractor()
        let router: SignUpRouter = SignUpRouter(viewController: view)
        let presenter: SignUpPresenter = SignUpPresenter(view: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        interactor.webService = WebService.shared
        router.viewController = view
        
        return view
    }
}

// Presenter -> Router
extension SignUpRouter: SignUpRouterProtocol {

    func changeToHome() {
     
        guard let nav = viewController.navigationController else {
            assertionFailure("got nav failure")
            return
        }
        let home = HomeRouter.createModule()
        nav.setViewControllers([home], animated: true)
    }
    
}
