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
    func changeToHomeModule()
}

// MARK: Presenter
protocol SignInPresenterProtocol: AnyObject {
    // View -> Presenter
    func send(name: String?, password: String?)
    func check(name: String?, password: String?)
}

// MARK: Interactor Input
protocol SignInInputInteractorProtocol: AnyObject {
    var presenter: SignInOutputInteractorProtocol! { get set }
    var webService: SignInWebServiceProtocol! { get set }

    // Presenter -> Interactor
    func signIn(name: String?, password: String?)
    func check(name: String?, password: String?) -> Bool
}

// MARK: Interactor Output
protocol SignInOutputInteractorProtocol: AnyObject {
    // Interactor -> Presenter
    func signInSuccess()
    func signInFailure(error: Error?)
}

// MARK: View
protocol SignInViewProtocol: AnyObject {
    var presenter: SignInPresenterProtocol! { get set }
    
    // PRESENTER -> VIEW
    func showLoading()
    func dismissLoading()
    
    func showMessage(_ message: String)
    
    func sendButtonStatus(enabled: Bool)
}

protocol SignInWebServiceProtocol: AnyObject {
    func signIn(name: String,
                password: String,
                success: EmptySuccessClosure?,
                failure: ErrorClosure?)
}
