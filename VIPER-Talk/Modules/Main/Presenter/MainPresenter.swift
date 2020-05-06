//
//  MainPresenter.swift
//  VIPER-Talk
//
//  Created by Nick on 5/6/20.
//  Copyright © 2020 co.Kcin.Nil. All rights reserved.
//

import Foundation

final class MainPresenter: MainPresenterProtocol {
    
    private weak var view: MainViewProtocol?
    var interactor: MainInteractorProtocol?
    private let router: MainRouterProtocol
    
    init(view: MainViewProtocol, interactor: MainInteractorProtocol, router: MainRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}
