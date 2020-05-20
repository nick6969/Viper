//
//  HomeRouter.swift
//  VIPER-Talk
//
//  Created by Nick on 5/14/20.
//  Copyright © 2020 co.Kcin.Nil. All rights reserved.
//

import UIKit

final class HomeRouter {
    
    private unowned var view: HomeViewProtocol
    
    init(view: HomeViewProtocol) {
        self.view = view
    }

    static func createModule() -> HomeViewProtocol {
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

// Presenter -> Router
extension HomeRouter: HomeRouterProtocol {

    func pushToCatrgoty(id: String) {
        guard let nav = view.navigationController else {
            assertionFailure("can't got navigationController, please check.")
            return
        }

        let category = CategoryRouter.createModule(branchID: id)
        nav.pushViewController(category, animated: true)
    }

}
