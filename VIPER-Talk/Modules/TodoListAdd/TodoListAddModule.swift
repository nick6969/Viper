//
//  TodoListAddModule.swift
//  VIPER-Talk
//
//  Created by Nick on 5/22/20.
//  Copyright © 2020 co.Kcin.Nil. All rights reserved.
//

import UIKit

enum TodoListAddModule {

    static func build(delegate: TodoListAddDelegate) -> TodoListAddPresenterToViewProtocol {
        let view: TodoListAddViewController = TodoListAddViewController()
        let interactor: TodoListAddInteractor = TodoListAddInteractor()
        let router: TodoListAddRouter = TodoListAddRouter(view)
        let presenter: TodoListAddPresenter = TodoListAddPresenter(view, interactor, router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.presenter = presenter
        router.addDelegate = delegate
        
        return view
    }

}
