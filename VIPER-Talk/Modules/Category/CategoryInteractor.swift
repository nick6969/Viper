//
//  CategoryInteractor.swift
//  VIPER-Talk
//
//  Created by Nick on 5/15/20.
//  Copyright © 2020 co.Kcin.Nil. All rights reserved.
//

import Foundation

final class CategoryInteractor {
    
    var presenter: CategoryOutputInteractorProtocol?
    var webService: CategoryWebServiceProtocol?
    var models: [BranchModel] = []
}

// Presenter -> Interactor
extension CategoryInteractor: CategoryInputInteractorProtocol {
    
    func loadCategory(id: String) {
        webService?.getCategoryWith(id: id, success: {[weak self] models in
            DispatchQueue.main.async {
                self?.models = models
                self?.presenter?.loadCategorySuccess()
            }
            }, failure: {[weak self] error in
                DispatchQueue.main.async {
                    self?.presenter?.loadCategotyFailure(error: error)
                }
        })
    }
    
}
