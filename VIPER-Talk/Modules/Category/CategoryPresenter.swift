//
//  CategoryPresenter.swift
//  VIPER-Talk
//
//  Created by Nick on 5/15/20.
//  Copyright © 2020 co.Kcin.Nil. All rights reserved.
//

import Foundation

final class CategoryPresenter {
    
    private weak var view: CategoryPresenterToViewProtocol!
    private let interactor: CategoryPresenterToInteractorProtocol
    private let router: CategoryPresenterToRouterProtocol
    private let branchID: String
        
    init(view: CategoryPresenterToViewProtocol,
         interactor: CategoryPresenterToInteractorProtocol,
         router: CategoryPresenterToRouterProtocol,
         branchID: String) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.branchID = branchID
    }
}

// View -> Presenter
extension CategoryPresenter: CategoryViewToPresenterProtocol {
    
    func loadCategory() {
        view?.showLoading()
        interactor.loadCategory(id: branchID)
    }
    
    func numberOfItem(in section: Int) -> Int {
        return interactor.models.count
    }
    
    func modelAt(index: Int) -> BranchModel {
        return interactor.models[index]
    }
    
    func didSelect(_ indexPath: IndexPath) {
        let model = interactor.models[indexPath.row]
        router.pushToSmallCategory(id: model.id)
    }

}

// Interactor -> Presenter
extension CategoryPresenter: CategoryInteractorToPresenterProtocol {
    
    func loadCategorySuccess() {
        view?.dismissLoading()
        view?.loadDone()
    }

    func loadCategotyFailure(error: Error?) {
        let message: String = error?.localizedDescription ?? "unKnow Error."
        view?.dismissLoading()
        view?.showMessage(message)
    }
    
}
