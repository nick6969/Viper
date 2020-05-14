//
//  MainProtocols.swift
//  VIPER-Talk
//
//  Created by Nick on 5/14/20.
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
    var presenter: MainOutputInteractorProtocol? { get set }

    // Presenter -> Interactor
}

// MARK: Interactor Output
protocol MainOutputInteractorProtocol: AnyObject {
    // Interactor -> Presenter
}

// MARK: View
protocol MainViewProtocol: AnyObject {
    var presenter: MainPresenterProtocol? { get set }
    
    // PRESENTER -> VIEW
}
