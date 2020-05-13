//
//  SignInProtocols.swift
//  VIPER-Talk
//
//  Created by Nick on 5/13/20.
//  Copyright © 2020 co.Kcin.Nil. All rights reserved.
//

import Foundation

// MARK: Router
protocol SignInRouterProtocol: AnyObject {
    // Presenter -> Router
}

// MARK: Presenter
protocol SignInPresenterProtocol: AnyObject {
    // View -> Presenter
}

// MARK: Interactor Input
protocol SignInInputInteractorProtocol: AnyObject {
    // Presenter -> Interactor
    var presenter: SignInOutputInteractorProtocol? { get set }
}

// MARK: Interactor Output
protocol SignInOutputInteractorProtocol: AnyObject {
    // Interactor -> Presenter
}

// MARK: View
protocol SignInViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: SignInPresenterProtocol? { get set }
}
