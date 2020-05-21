//
//  MainPresenter.swift
//  VIPER-Talk
//
//  Created by Nick on 5/14/20.
//  Copyright © 2020 co.Kcin.Nil. All rights reserved.
//

import Foundation

final class MainPresenter {
    
    private unowned var view: MainPresenterToViewProtocol!
    private let interactor: MainPresenterToInteractorProtocol
    private let router: MainPresenterToRouterProtocol
    
    init(view: MainPresenterToViewProtocol,
         interactor: MainPresenterToInteractorProtocol,
         router: MainPresenterToRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

// View -> Presenter
extension MainPresenter: MainViewToPresenterProtocol {
    
    func pushToSignIn() {
        router.pushToSignIn()
    }
    
    func pushToSignUp() {
        router.pushToSignUp()
    }
    
}

// Interactor -> Presenter
extension MainPresenter: MainInteractorToPresenterProtocol {

}
