//
//  MainModule.swift
//  VIPER-Talk
//
//  Created by Nick on 5/21/20.
//  Copyright © 2020 co.Kcin.Nil. All rights reserved.
//

import UIKit

enum MainModule {
    
    static func build() -> MainViewProtocol {
        let view: MainViewController = MainViewController()
        let interactor: MainInteractor = MainInteractor()
        let router: MainRouter = MainRouter(view: view)
        let presenter: MainPresenter = MainPresenter(view: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        
        return view
    }

}
