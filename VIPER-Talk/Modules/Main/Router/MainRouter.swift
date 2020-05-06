//
//  MainRouter.swift
//  VIPER-Talk
//
//  Created by Nick on 5/6/20.
//  Copyright © 2020 co.Kcin.Nil. All rights reserved.
//

import UIKit

final class MainRouter: MainRouterProtocol {
    
    weak var viewController: UIViewController?
    
    static func createModule() -> UIViewController {
        let view: MainViewController = MainViewController()
        let interractor: MainInteractor = MainInteractor()
        let router: MainRouter = MainRouter()
        let presenter: MainPresenter = MainPresenter(view: view, interactor: interractor, router: router)
        
        view.presenter = presenter
        interractor.presenter = presenter
        router.viewController = view
        
        return view
    }
}
