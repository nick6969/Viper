//
//  SignInProtocols.swift
//  VIPER-Talk
//
//  Created by Nick on 5/13/20.
//  Copyright © 2020 co.Kcin.Nil. All rights reserved.
//

import UIKit

protocol SignInPresenterToRouterProtocol: AnyObject {
    // Presenter -> Router
    func changeToHomeModule()
}

protocol SignInViewToPresenterProtocol: AnyObject {
    // View -> Presenter
    func send(name: String?, password: String?)
    func check(name: String?, password: String?)
}

protocol SignInPresenterToViewProtocol: UIViewController {
    // PRESENTER -> VIEW
    func showLoading()
    func dismissLoading()
    func showMessage(_ message: String)
    func sendButtonStatus(enabled: Bool)
}

protocol SignInPresenterToInteractorProtocol: AnyObject {
    // Presenter -> Interactor
    func signIn(name: String?, password: String?)
    func check(name: String?, password: String?) -> Bool
}

protocol SignInInteractorToPresenterProtocol: AnyObject {
    // Interactor -> Presenter
    func signInSuccess()
    func signInFailure(error: Error?)
}

protocol SignInWebServiceProtocol: AnyObject {
    func signIn(name: String,
                password: String,
                success: EmptySuccessClosure?,
                failure: ErrorClosure?)
}
