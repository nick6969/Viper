//
//  CategotyInteractor.swift
//  VIPER-Talk
//
//  Created by Nick on 5/15/20.
//  Copyright © 2020 co.Kcin.Nil. All rights reserved.
//

import Foundation

final class CategotyInteractor {
    
    var presenter: CategotyOutputInteractorProtocol?
    
}

// Presenter -> Interactor
extension CategotyInteractor: CategotyInputInteractorProtocol {
    
    func loadCategory(id: String) {
        WebService.shared.getCategoryWith(id: id, success: {[weak self] models in
            DispatchQueue.main.async {
                self?.presenter?.loadCategorySuccess(models: models)
            }
            }, failure: {[weak self] error in
                DispatchQueue.main.async {
                    self?.presenter?.loadCategotyFailure(error: error)
                }
        })
    }
    
}
