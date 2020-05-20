//
//  CategoryModule.swift
//  VIPER-Talk
//
//  Created by Nick on 5/21/20.
//  Copyright © 2020 co.Kcin.Nil. All rights reserved.
//

import UIKit

enum CategoryModule {
    
    static func build(branchID: String) -> CategoryViewProtocol {
        let view: CategoryViewController = CategoryViewController()
        let interactor: CategoryInteractor = CategoryInteractor()
        let router: CategoryRouter = CategoryRouter(view: view)
        let presenter: CategoryPresenter = CategoryPresenter(view: view, interactor: interactor, router: router, branchID: branchID)
        
        view.presenter = presenter
        interactor.presenter = presenter
        interactor.webService = WebService.shared
        
        return view
    }

}
