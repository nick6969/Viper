//
//  MainPresenter.swift
//  VIPER-Talk
//
//  Created by Nick on 5/14/20.
//  Copyright © 2020 co.Kcin.Nil. All rights reserved.
//

import Foundation

final class MainPresenter {
    
    private weak var view: MainViewProtocol?
    private let interactor: MainInputInteractorProtocol
    private let router: MainRouterProtocol
    
    init(view: MainViewProtocol, interactor: MainInputInteractorProtocol, router: MainRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

// View -> Presenter
extension MainPresenter: MainPresenterProtocol {
    
    func pushToSignIn() {
        router.pushToSignIn()
    }
    
    func pushToSignUp() {
        router.pushToSignUp()
    }
    
}

// Interactor -> Presenter
extension MainPresenter: MainOutputInteractorProtocol {

}
