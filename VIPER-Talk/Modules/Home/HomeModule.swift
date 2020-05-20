//
//  HomeModule.swift
//  VIPER-Talk
//
//  Created by Nick on 5/21/20.
//  Copyright © 2020 co.Kcin.Nil. All rights reserved.
//

import UIKit

enum HomeModule {
    
    static func build() -> HomeViewProtocol {
        let view: HomeViewController = HomeViewController()
        let interactor: HomeInteractor = HomeInteractor()
        let router: HomeRouter = HomeRouter(view: view)
        let presenter: HomePresenter = HomePresenter(view: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        interactor.webService = WebService.shared
        
        return view
    }

}
