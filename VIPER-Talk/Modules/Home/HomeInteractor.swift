//
//  HomeInteractor.swift
//  VIPER-Talk
//
//  Created by Nick on 5/14/20.
//  Copyright © 2020 co.Kcin.Nil. All rights reserved.
//

import Foundation

final class HomeInteractor {
    
    var presenter: HomeOutputInteractorProtocol?
    var webService: HomeWebServiceProtocol?

}

// Presenter -> Interactor
extension HomeInteractor: HomeInputInteractorProtocol {
    
    func loadBranch() {
        webService?.getBranch(success: { [weak self] models in
            DispatchQueue.main.async {
                self?.presenter?.loadBranchSuccess(models: models)
            }
        }, failure: { [weak self] error in
            DispatchQueue.main.async {
                self?.presenter?.loadBranchFailure(error: error)
            }
        })
    }
}
