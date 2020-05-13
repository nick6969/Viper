//
//  SignUpProtocols.swift
//  VIPER-Talk
//
//  Created by Nick on 5/13/20.
//  Copyright © 2020 co.Kcin.Nil. All rights reserved.
//

import Foundation

// MARK: Router
protocol SignUpRouterProtocol: AnyObject {
    // Presenter -> Router
}

// MARK: Presenter
protocol SignUpPresenterProtocol: AnyObject {
    // View -> Presenter
}

// MARK: Interactor Input
protocol SignUpInputInteractorProtocol: AnyObject {
    // Presenter -> Interactor
    var presenter: SignUpOutputInteractorProtocol? { get set }
}

// MARK: Interactor Output
protocol SignUpOutputInteractorProtocol: AnyObject {
    // Interactor -> Presenter
}

// MARK: View
protocol SignUpViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: SignUpPresenterProtocol? { get set }
}
