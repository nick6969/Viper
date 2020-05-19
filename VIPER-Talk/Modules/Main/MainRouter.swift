//
//  MainRouter.swift
//  VIPER-Talk
//
//  Created by Nick on 5/14/20.
//  Copyright © 2020 co.Kcin.Nil. All rights reserved.
//

import UIKit

final class MainRouter {
    
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
}

// Presenter -> Router
extension MainRouter: MainRouterProtocol {

    func pushToSignIn() {
        guard let nav: UINavigationController = viewController?.navigationController else {
            assertionFailure("can't got navigationController, please check.")
            return
        }
        let signInModule = SignInRouter.createModule()
        nav.pushViewController(signInModule, animated: true)
    }
    
    func pushToSignUp() {
        // TODO:- go to signUp Module
    }

}
