//
//  MainRouter.swift
//  VIPER-Talk
//
//  Created by Nick on 5/6/20.
//  Copyright © 2020 co.Kcin.Nil. All rights reserved.
//

import UIKit

final class MainRouter: MainRouterProtocol {
    
    weak var viewController: UIViewController?
    
    static func createModule() -> UIViewController {
        let view: MainViewController = MainViewController()
        let interactor: MainInteractor = MainInteractor()
        let router: MainRouter = MainRouter()
        let presenter: MainPresenter = MainPresenter(view: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
    
    func pushToSignIn() {
        let signInModule = SignInRouter.createModule()
        viewController?.navigationController?.pushViewController(signInModule, animated: true)
    }
    
    func pushToSignUp() {
        let signUpModule = SignUpRouter.createModule()
        viewController?.navigationController?.pushViewController(signUpModule, animated: true)

    }
    
}
