//
//  HomeInteractor.swift
//  VIPER-Talk
//
//  Created by Nick on 5/14/20.
//  Copyright © 2020 co.Kcin.Nil. All rights reserved.
//

import Foundation

final class HomeInteractor {
    
    unowned var presenter: HomeOutputInteractorProtocol!
    var webService: HomeWebServiceProtocol!
    
    var models: [BranchModel] = []
}

// Presenter -> Interactor
extension HomeInteractor: HomeInputInteractorProtocol {
    
    func loadBranch() {
        webService.getBranch(success: { [weak self] models in
            DispatchQueue.main.async {
                self?.models = models
                self?.presenter.loadBranchSuccess()
            }
        }, failure: { [weak self] error in
            DispatchQueue.main.async {
                self?.presenter.loadBranchFailure(error: error)
            }
        })
    }
}
