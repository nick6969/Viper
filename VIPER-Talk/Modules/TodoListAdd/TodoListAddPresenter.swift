//
//  TodoListAddPresenter.swift
//  VIPER-Talk
//
//  Created by Nick on 5/22/20.
//  Copyright © 2020 co.Kcin.Nil. All rights reserved.
//

import Foundation

final class TodoListAddPresenter {
    
    private unowned var view: TodoListAddPresenterToViewProtocol!
    private let interactor: TodoListAddPresenterToInteractorProtocol
    private let router: TodoListAddPresenterToRouterProtocol
    
    init(_ view: TodoListAddPresenterToViewProtocol, 
         _ interactor: TodoListAddPresenterToInteractorProtocol, 
         _ router: TodoListAddPresenterToRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

// View -> Presenter
extension TodoListAddPresenter: TodoListAddViewToPresenterProtocol {
    
    func addTodoList(title: String?, description: String?, date: Date?) {
        interactor.addTodoList(title: title, description: description, date: date)
    }
    
}

// Interactor -> Presenter
extension TodoListAddPresenter: TodoListAddInteractorToPresenterProtocol {

    func addDone(model: TodoListModel) {
        router.addDone(model: model)
    }
    
    func addFailure(error: Error) {
        view.showMessage(error.localizedDescription)
    }

}

// Router -> Presenter
extension TodoListAddPresenter: TodoListAddRouterToPresenterProtocol {

}
