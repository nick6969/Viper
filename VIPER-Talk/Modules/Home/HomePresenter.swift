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
        return interactor.models.count
    }

    func modelAt(index: Int) -> BranchModel {
        return interactor.models[index]
    }
    
    func didSelect(_ indexPath: IndexPath) {
        let model = interactor.models[indexPath.row]
        router.pushToCatrgoty(id: model.id)
    }
}

// Interactor -> Presenter
extension HomePresenter: HomeOutputInteractorProtocol {
    
    func loadBranchSuccess() {
        view?.dismissLoading()
        view?.loadDone()
    }
    
    func loadBranchFailure(error: Error?) {
        let message: String = error?.localizedDescription ?? "unKnow Error."
        view?.dismissLoading()
        view?.showMessage(message)
    }
}
