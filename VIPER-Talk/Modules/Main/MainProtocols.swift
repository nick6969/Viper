//
//  MainProtocols.swift
//  VIPER-Talk
//
//  Created by Nick on 5/14/20.
//  Copyright © 2020 co.Kcin.Nil. All rights reserved.
//

import UIKit

protocol MainPresenterToRouterProtocol: AnyObject {
    // Presenter -> Router
    func pushToSignIn()
    func pushToSignUp()
}

protocol MainViewToPresenterProtocol: AnyObject {
    // View -> Presenter
    func pushToSignIn()
    func pushToSignUp()
}

protocol MainPresenterToViewProtocol: UIViewController {
    // PRESENTER -> VIEW
}

protocol MainPresenterToInteractorProtocol: AnyObject {
    // Presenter -> Interactor
}

protocol MainInteractorToPresenterProtocol: AnyObject {
    // Interactor -> Presenter
}
