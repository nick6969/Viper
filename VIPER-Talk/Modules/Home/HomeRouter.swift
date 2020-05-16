//
//  HomeRouter.swift
//  VIPER-Talk
//
//  Created by Nick on 5/14/20.
//  Copyright © 2020 co.Kcin.Nil. All rights reserved.
//

import UIKit

final class HomeRouter {
    
    weak var viewController: UIViewController?
    
    static func createModule() -> UIViewController {
        let view: HomeViewController = HomeViewController()
        let interactor: HomeInteractor = HomeInteractor()
        let router: HomeRouter = HomeRouter()
        let presenter: HomePresenter = HomePresenter(view: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        interactor.webService = WebService.shared
        router.viewController = view
        
        return view
    }
}

// Presenter -> Router
extension HomeRouter: HomeRouterProtocol {

    func pushToCatrgoty(id: String) {
        let category = CategoryRouter.createModule(branchID: id)
        viewController?.navigationController?.pushViewController(category, animated: true)
    }

}
