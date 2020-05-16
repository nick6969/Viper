//
//  CategoryPresenter.swift
//  VIPER-Talk
//
//  Created by Nick on 5/15/20.
//  Copyright © 2020 co.Kcin.Nil. All rights reserved.
//

import Foundation

final class CategoryPresenter {
    
    private weak var view: CategoryViewProtocol?
    private let interactor: CategoryInputInteractorProtocol
    private let router: CategoryRouterProtocol
    private let branchID: String
    
    private var models: [BranchModel] = []
    
    init(view: CategoryViewProtocol, interactor: CategoryInputInteractorProtocol, router: CategoryRouterProtocol, branchID: String) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.branchID = branchID
    }
}

// View -> Presenter
extension CategoryPresenter: CategoryPresenterProtocol {
    
    func loadCategory() {
        view?.showLoading()
        interactor.loadCategory(id: branchID)
    }
    
    func numberOfItem(in section: Int) -> Int {
        return models.count
    }
    
    func modelAt(index: Int) -> BranchModel {
        return models[index]
    }
    
    func didSelect(_ indexPath: IndexPath) {
        router.pushToSmallCategory(id: models[indexPath.row].id)
    }

}

// Interactor -> Presenter
extension CategoryPresenter: CategoryOutputInteractorProtocol {
    
    func loadCategorySuccess(models: [BranchModel]) {
        self.models = models
        view?.dismissLoading()
        view?.loadDone()
    }

    func loadCategotyFailure(error: Error?) {
        let message: String = error?.localizedDescription ?? "unKnow Error."
        view?.dismissLoading()
        view?.showMessage(message)
    }
    
}