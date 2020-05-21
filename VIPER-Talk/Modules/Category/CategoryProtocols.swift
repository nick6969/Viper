//
//  CategoryProtocols.swift
//  VIPER-Talk
//
//  Created by Nick on 5/15/20.
//  Copyright © 2020 co.Kcin.Nil. All rights reserved.
//

import UIKit

protocol CategoryPresenterToRouterProtocol: AnyObject {
    // Presenter -> Router
    func pushToSmallCategory(id: String)
}

protocol CategoryViewToPresenterProtocol: AnyObject {
    // View -> Presenter
    func loadCategory()
    func numberOfItem(in section: Int) -> Int
    func modelAt(index: Int) -> BranchModel
    func didSelect(_ indexPath: IndexPath)
}

protocol CategoryPresenterToViewProtocol: UIViewController {
    // PRESENTER -> VIEW
    func showLoading()
    func dismissLoading()
    func showMessage(_ message: String)
    func loadDone()
}

protocol CategoryPresenterToInteractorProtocol: AnyObject {
    var models: [BranchModel] { get }

    // Presenter -> Interactor
    func loadCategory(id: String)
}

protocol CategoryInteractorToPresenterProtocol: AnyObject {
    // Interactor -> Presenter
    func loadCategorySuccess()
    func loadCategotyFailure(error: Error?)
}

protocol CategoryWebServiceProtocol {
    func getCategoryWith(id: String,
                         success: ModelSuccessClosure<[BranchModel]>?,
                         failure: ErrorClosure?)
}
