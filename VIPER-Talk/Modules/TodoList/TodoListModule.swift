//
//  TodoListModule.swift
//  VIPER-Talk
//
//  Created by Nick on 5/21/20.
//  Copyright © 2020 co.Kcin.Nil. All rights reserved.
//

import UIKit

enum TodoListModule {

  static func build() -> TodoListPresenterToViewProtocol {
      let view: TodoListViewController = TodoListViewController()
      let interactor: TodoListInteractor = TodoListInteractor()
      let router: TodoListRouter = TodoListRouter(view)
      let presenter: TodoListPresenter = TodoListPresenter(view, interactor, router)
      
      view.presenter = presenter
      interactor.presenter = presenter
      router.presenter = presenter
      
      return view
  }

}
