//
//  SignUpProtocols.swift
//  VIPER-Talk
//
//  Created by Nick on 5/19/20.
//  Copyright © 2020 co.Kcin.Nil. All rights reserved.
//

import UIKit

protocol SignUpPresenterToRouterProtocol: AnyObject {
    // Presenter -> Router
    func changeToHome()
}

protocol SignUpViewToPresenterProtocol: AnyObject {
    // View -> Presenter
    func check(username: String?, password: String?)
    func send(username: String?, password: String?)
}

protocol SignUpPresenterToViewProtocol: UIViewController {
    // PRESENTER -> VIEW
    func showLoading()
    func dismissLoading()
    func showMessage(_ message: String)
    func checkSendButton(enabled: Bool)
}

protocol SignUpPresenterToInteractorProtocol: AnyObject {
    // Presenter -> Interactor
    func check(username: String?, password: String?) -> Bool
    func send(username: String?, password: String?)
}

// MARK: Interactor Output
protocol SignUpInteractorToPresenterProtocol: AnyObject {
    // Interactor -> Presenter
    func signUpSuccess()
    func signUpFailure(error: Error?)
}

protocol SignUpWebServiceProtocol: AnyObject {
    // Interactor -> WebService
    func signUp(name: String,
                password: String,
                success: EmptySuccessClosure?,
                failure: ErrorClosure?)
}
