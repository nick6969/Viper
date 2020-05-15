//
//  CategotyRouter.swift
//  VIPER-Talk
//
//  Created by Nick on 5/15/20.
//  Copyright © 2020 co.Kcin.Nil. All rights reserved.
//

import UIKit

final class CategotyRouter {
    
    weak var viewController: UIViewController?
    
    static func createModule(branchID: String) -> UIViewController {
        let view: CategotyViewController = CategotyViewController()
        let interactor: CategotyInteractor = CategotyInteractor()
        let router: CategotyRouter = CategotyRouter()
        let presenter: CategotyPresenter = CategotyPresenter(view: view, interactor: interactor, router: router, branchID: branchID)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
}

// Presenter -> Router
extension CategotyRouter: CategotyRouterProtocol {

    func pushToSmallCategory(id: String) {
        // TODO: - pushToSmallCategory
    }
}
