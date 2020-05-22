//
//  TodoListRouter.swift
//  VIPER-Talk
//
//  Created by Nick on 5/21/20.
//  Copyright © 2020 co.Kcin.Nil. All rights reserved.
//

import UIKit

final class TodoListRouter {
    
    private unowned var view: TodoListPresenterToViewProtocol
    unowned var presenter: TodoListRouterToPresenterProtocol!

    init(_ view: TodoListPresenterToViewProtocol) {
        self.view = view
    }

}

// Presenter -> Router
extension TodoListRouter: TodoListPresenterToRouterProtocol {
    
    func pushToAddTodoList() {
        guard let nav = view.navigationController else {
            assertionFailure("got nav failure")
            return
        }
        let addModule = TodoListAddModule.build(delegate: self)
        nav.pushViewController(addModule, animated: true)
    }
    
}

//  Add Module Call Back
extension TodoListRouter: TodoListAddDelegate {
    
    func addNewTodoList(model: TodoListModel) {
        presenter.addNewTodoList(model: model)
    }

}
