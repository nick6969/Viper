//
//  HomePresenter.swift
//  VIPER-Talk
//
//  Created by Nick on 5/14/20.
//  Copyright © 2020 co.Kcin.Nil. All rights reserved.
//

import Foundation

final class HomePresenter {
    
    private weak var view: HomeViewProtocol?
    private let interactor: HomeInputInteractorProtocol
    private let router: HomeRouterProtocol
    
    private var models: [BranchModel] = []
    
    init(view: HomeViewProtocol, interactor: HomeInputInteractorProtocol, router: HomeRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

// View -> Presenter
extension HomePresenter: HomePresenterProtocol {
    
    func loadBranch() {
        view?.showLoading()
        interactor.loadBranch()
    }
    
    func numberOfItem(in section: Int) -> Int {
        return models.count
    }

    func modelAt(index: Int) -> BranchModel {
        return models[index]
    }
    
    func didSelect(_ indexPath: IndexPath) {
        router.pushToCatrgoty(id: models[indexPath.row].id)
    }
}

// Interactor -> Presenter
extension HomePresenter: HomeOutputInteractorProtocol {
    
    func loadBranchSuccess(models: [BranchModel]) {
        self.models = models
        view?.dismissLoading()
        view?.loadDone()
    }
    
    func loadBranchFailure(error: Error?) {
        let message: String = error?.localizedDescription ?? "unKnow Error."
        view?.dismissLoading()
        view?.showMessage(message)
    }
}
