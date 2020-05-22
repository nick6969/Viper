//
//  TodoListAddRouter.swift
//  VIPER-Talk
//
//  Created by Nick on 5/22/20.
//  Copyright © 2020 co.Kcin.Nil. All rights reserved.
//

import UIKit

final class TodoListAddRouter {
    
    private unowned var view: TodoListAddPresenterToViewProtocol
    unowned var presenter: TodoListAddRouterToPresenterProtocol!
    unowned var addDelegate: TodoListAddDelegate!
    
    init(_ view: TodoListAddPresenterToViewProtocol) {
        self.view = view
    }

}

// Presenter -> Router
extension TodoListAddRouter: TodoListAddPresenterToRouterProtocol {
    
    func addDone(model: TodoListModel) {
        addDelegate.addNewTodoList(model: model)
        guard let nav = view.navigationController else {
            assertionFailure("got nav failure")
            return
        }
        nav.popViewController(animated: true)
    }
    
}
