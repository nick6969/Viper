//
//  CategotyProtocols.swift
//  VIPER-Talk
//
//  Created by Nick on 5/15/20.
//  Copyright © 2020 co.Kcin.Nil. All rights reserved.
//

import Foundation

// MARK: Router
protocol CategotyRouterProtocol: AnyObject {
    // Presenter -> Router
    func pushToSmallCategory(id: String)
}

// MARK: Presenter
protocol CategotyPresenterProtocol: AnyObject {
    // View -> Presenter
    func loadCategory()
    func numberOfItem(in section: Int) -> Int
    func modelAt(index: Int) -> BranchModel
    func didSelect(_ indexPath: IndexPath)
}

// MARK: Interactor Input
protocol CategotyInputInteractorProtocol: AnyObject {
    var presenter: CategotyOutputInteractorProtocol? { get set }

    // Presenter -> Interactor
    func loadCategory(id: String)
}

// MARK: Interactor Output
protocol CategotyOutputInteractorProtocol: AnyObject {
    // Interactor -> Presenter
    func loadCategorySuccess(models: [BranchModel])
    func loadCategotyFailure(error: Error?)
}

// MARK: View
protocol CategotyViewProtocol: AnyObject {
    var presenter: CategotyPresenterProtocol? { get set }
    
    // PRESENTER -> VIEW
    func showLoading()
    func dismissLoading()
    
    func showMessage(_ message: String)
    func loadDone()
}
