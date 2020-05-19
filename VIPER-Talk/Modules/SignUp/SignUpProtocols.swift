//
//  SignUpProtocols.swift
//  VIPER-Talk
//
//  Created by Nick on 5/19/20.
//  Copyright © 2020 co.Kcin.Nil. All rights reserved.
//

import Foundation

// MARK: Router
protocol SignUpRouterProtocol: AnyObject {
    // Presenter -> Router
    func changeToHome()
}

// MARK: Presenter
protocol SignUpPresenterProtocol: AnyObject {
    // View -> Presenter
    func check(username: String?, password: String?)
    func send(username: String?, password: String?)
}

// MARK: Interactor Input
protocol SignUpInputInteractorProtocol: AnyObject {
    var presenter: SignUpOutputInteractorProtocol? { get set }

    // Presenter -> Interactor
    func check(username: String?, password: String?) -> Bool
    func send(username: String?, password: String?)
}

// MARK: Interactor Output
protocol SignUpOutputInteractorProtocol: AnyObject {
    // Interactor -> Presenter
    func signUpSuccess()
    func signUpFailure(error: Error?)
}

// MARK: View
protocol SignUpViewProtocol: AnyObject {
    var presenter: SignUpPresenterProtocol? { get set }
    
    // PRESENTER -> VIEW
    func showLoading()
    func dismissLoading()
    
    func showMessage(_ message: String)
    
    func checkSendButton(enabled: Bool)
}

// MARK: WebService
protocol SignUpWebServiceProtocol: AnyObject {
    // Interactor -> WebService
    func signUp(name: String,
                password: String,
                success: EmptySuccessClosure?,
                failure: ErrorClosure?)
}
