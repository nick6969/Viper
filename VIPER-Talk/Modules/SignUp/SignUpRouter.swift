//
//  SignUpRouter.swift
//  VIPER-Talk
//
//  Created by Nick on 5/13/20.
//  Copyright © 2020 co.Kcin.Nil. All rights reserved.
//

import UIKit

final class SignUpRouter: SignUpRouterProtocol {
    
    weak var viewController: UIViewController?
    
    static func createModule() -> UIViewController {
        let view: SignUpViewController = SignUpViewController()
        let interactor: SignUpInteractor = SignUpInteractor()
        let router: SignUpRouter = SignUpRouter()
        let presenter: SignUpPresenter = SignUpPresenter(view: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
}
