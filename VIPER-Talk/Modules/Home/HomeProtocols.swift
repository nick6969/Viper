//
//  HomeProtocols.swift
//  VIPER-Talk
//
//  Created by Nick on 5/14/20.
//  Copyright © 2020 co.Kcin.Nil. All rights reserved.
//

import Foundation

// MARK: Router
protocol HomeRouterProtocol: AnyObject {
    // Presenter -> Router
    func pushToCatrgoty(id: String)
}

// MARK: Presenter
protocol HomePresenterProtocol: AnyObject {
    // View -> Presenter
    func loadBranch()
    func numberOfItem(in section: Int) -> Int
    func modelAt(index: Int) -> BranchModel
    func didSelect(_ indexPath: IndexPath)
}

// MARK: Interactor Input
protocol HomeInputInteractorProtocol: AnyObject {
    var presenter: HomeOutputInteractorProtocol! { get set }
    var webService: HomeWebServiceProtocol! { get set }
    var models: [BranchModel] { get }
    
    // Presenter -> Interactor
    func loadBranch()
}

// MARK: Interactor Output
protocol HomeOutputInteractorProtocol: AnyObject {
    // Interactor -> Presenter
    func loadBranchSuccess()
    func loadBranchFailure(error: Error?)
}

// MARK: View
protocol HomeViewProtocol: AnyObject {
    var presenter: HomePresenterProtocol! { get set }
    
    // PRESENTER -> VIEW
    func showLoading()
    func dismissLoading()
    
    func showMessage(_ message: String)
    func loadDone()
}

// MARK: WebService
protocol HomeWebServiceProtocol: AnyObject {
    // Interactor -> WebService
    func getBranch(success: ModelSuccessClosure<[BranchModel]>?,
                   failure: ErrorClosure?)
}
