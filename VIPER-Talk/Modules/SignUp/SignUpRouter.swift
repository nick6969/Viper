//
//  SignUpRouter.swift
//  VIPER-Talk
//
//  Created by Nick on 5/19/20.
//  Copyright © 2020 co.Kcin.Nil. All rights reserved.
//

import UIKit

final class SignUpRouter {
    
    private unowned var view: SignUpViewProtocol

    init(view: SignUpViewProtocol) {
        self.view = view
    }

    static func createModule() -> SignUpViewProtocol {
        let view: SignUpViewController = SignUpViewController()
        let interactor: SignUpInteractor = SignUpInteractor()
        let router: SignUpRouter = SignUpRouter(view: view)
        let presenter: SignUpPresenter = SignUpPresenter(view: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        interactor.webService = WebService.shared
        
        return view
    }
}

// Presenter -> Router
extension SignUpRouter: SignUpRouterProtocol {

    func changeToHome() {
     
        guard let nav = view.navigationController else {
            assertionFailure("got nav failure")
            return
        }
        let home = HomeRouter.createModule()
        nav.setViewControllers([home], animated: true)
    }
    
}
