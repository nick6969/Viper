//
//  HomeProtocols.swift
//  VIPER-Talk
//
//  Created by Nick on 5/14/20.
//  Copyright © 2020 co.Kcin.Nil. All rights reserved.
//

import UIKit

protocol HomePresenterToRouterProtocol: AnyObject {
    // Presenter -> Router
    func pushToCatrgoty(id: String)
}

protocol HomeViewToPresenterProtocol: AnyObject {
    // View -> Presenter
    func loadBranch()
    func numberOfItem(in section: Int) -> Int
    func modelAt(index: Int) -> BranchModel
    func didSelect(_ indexPath: IndexPath)
}

protocol HomePresenterToViewProtocol: UIViewController {
    // PRESENTER -> VIEW
    func showLoading()
    func dismissLoading()
    func showMessage(_ message: String)
    func loadDone()
}

protocol HomePresenterToInteractorProtocol: AnyObject {
    var models: [BranchModel] { get }
    
    // Presenter -> Interactor
    func loadBranch()
}

protocol HomeInteractorToPresenterProtocol: AnyObject {
    // Interactor -> Presenter
    func loadBranchSuccess()
    func loadBranchFailure(error: Error?)
}

protocol HomeWebServiceProtocol: AnyObject {
    // Interactor -> WebService
    func getBranch(success: ModelSuccessClosure<[BranchModel]>?,
                   failure: ErrorClosure?)
}
