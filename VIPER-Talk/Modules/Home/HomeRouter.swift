//
//  HomeRouter.swift
//  VIPER-Talk
//
//  Created by Nick on 5/14/20.
//  Copyright © 2020 co.Kcin.Nil. All rights reserved.
//

import Foundation

final class HomeRouter {
    
    private unowned var view: HomePresenterToViewProtocol
    
    init(view: HomePresenterToViewProtocol) {
        self.view = view
    }

}

// Presenter -> Router
extension HomeRouter: HomePresenterToRouterProtocol {

    func pushToCatrgoty(id: String) {
        guard let nav = view.navigationController else {
            assertionFailure("can't got navigationController, please check.")
            return
        }

        let category = CategoryModule.build(branchID: id)
        nav.pushViewController(category, animated: true)
    }

}
