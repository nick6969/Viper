//
//  SignInModule.swift
//  VIPER-Talk
//
//  Created by Nick on 5/21/20.
//  Copyright © 2020 co.Kcin.Nil. All rights reserved.
//

import UIKit

enum SignInModule {
    
    static func build() -> SignInViewProtocol {
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
