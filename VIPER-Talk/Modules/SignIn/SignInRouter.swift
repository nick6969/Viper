//
//  SignInRouter.swift
//  VIPER-Talk
//
//  Created by Nick on 5/13/20.
//  Copyright © 2020 co.Kcin.Nil. All rights reserved.
//

import UIKit

final class SignInRouter: SignInRouterProtocol {
    
    weak var viewController: UIViewController?
    
    static func createModule() -> UIViewController {
        let view: SignInViewController = SignInViewController()
        let interactor: SignInInteractor = SignInInteractor()
        let router: SignInRouter = SignInRouter()
        let presenter: SignInPresenter = SignInPresenter(view: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
}
