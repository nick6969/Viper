//
//  MainProtocols.swift
//  VIPER-Talk
//
//  Created by Nick on 5/6/20.
//  Copyright © 2020 co.Kcin.Nil. All rights reserved.
//

import Foundation

// MARK: Router
protocol MainRouterProtocol: AnyObject {
    // Presenter -> Router
    func pushToSignIn()
    func pushToSignUp()
}

// MARK: Presenter
protocol MainPresenterProtocol: AnyObject {
    // View -> Presenter
    func pushToSignIn()
    func pushToSignUp()
}

// MARK: Interactor Input
protocol MainInputInteractorProtocol: AnyObject {
    // Presenter -> Interactor
    var presenter: MainOutputInteractorProtocol? { get set }
}

// MARK: Interactor Output
protocol MainOutputInteractorProtocol: AnyObject {
    // Interactor -> Presenter
}

// MARK: View
protocol MainViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: MainPresenterProtocol? { get set }
}
