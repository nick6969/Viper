//
//  SignUpModule.swift
//  VIPER-Talk
//
//  Created by Nick on 5/21/20.
//  Copyright © 2020 co.Kcin.Nil. All rights reserved.
//

import UIKit

enum SignUpModule {
    
    static func build() -> SignUpViewProtocol {
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
