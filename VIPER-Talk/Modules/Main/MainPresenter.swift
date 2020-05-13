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
    var interactor: MainInputInteractorProtocol?
    private let router: MainRouterProtocol
    
    init(view: MainViewProtocol, interactor: MainInputInteractorProtocol, router: MainRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func pushToSignIn() {
        router.pushToSignIn()
    }
    
    func pushToSignUp() {
        router.pushToSignIn()
    }
}

extension MainPresenter: MainOutputInteractorProtocol {
    // Interactor -> Presenter
}
