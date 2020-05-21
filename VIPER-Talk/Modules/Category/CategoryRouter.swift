//
//  CategotyRouter.swift
//  VIPER-Talk
//
//  Created by Nick on 5/15/20.
//  Copyright © 2020 co.Kcin.Nil. All rights reserved.
//

import Foundation

final class CategoryRouter {
    
    private unowned var view: CategoryPresenterToViewProtocol

    init(view: CategoryPresenterToViewProtocol) {
        self.view = view
    }
    
}

// Presenter -> Router
extension CategoryRouter: CategoryPresenterToRouterProtocol {

    func pushToSmallCategory(id: String) {
        // TODO: - pushToSmallCategory
    }
}
