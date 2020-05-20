//
//  CategotyRouter.swift
//  VIPER-Talk
//
//  Created by Nick on 5/15/20.
//  Copyright © 2020 co.Kcin.Nil. All rights reserved.
//

import UIKit

final class CategoryRouter {
    
    private unowned var view: CategoryViewProtocol

    init(view: CategoryViewProtocol) {
        self.view = view
    }
    
    static func createModule(branchID: String) -> CategoryViewProtocol {
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

// Presenter -> Router
extension CategoryRouter: CategoryRouterProtocol {

    func pushToSmallCategory(id: String) {
        // TODO: - pushToSmallCategory
    }
}
