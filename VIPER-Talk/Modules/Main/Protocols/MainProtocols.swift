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
    
}

// MARK: Presenter
protocol MainPresenterProtocol: AnyObject {
    
}

// MARK: Interactor
protocol MainInteractorProtocol: AnyObject {
    
    var presenter: MainPresenterProtocol? { get set }
}

// MARK: View
protocol MainViewProtocol: AnyObject {
    
    var presenter: MainPresenterProtocol? { get set }
}
