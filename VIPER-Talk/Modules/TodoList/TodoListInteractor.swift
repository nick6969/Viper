//
//  TodoListInteractor.swift
//  VIPER-Talk
//
//  Created by Nick on 5/21/20.
//  Copyright © 2020 co.Kcin.Nil. All rights reserved.
//

import Foundation

final class TodoListInteractor {
    
    unowned var presenter: TodoListInteractorToPresenterProtocol!
    
    private var models: [TodoListModel] = []
}

// Presenter -> Interactor
extension TodoListInteractor: TodoListPresenterToInteractorProtocol {
    
    func loadTodoList() {
        if self.models.isEmpty, let models = Cache.todoLists {
            self.models = models
        }
        presenter.loadTodoListSuccess(models: self.models.map { $0.viewModel })
    }
    
    func addNewTodoList(model: TodoListModel) {
        models.append(model)
        presenter.loadTodoListSuccess(models: models.map { $0.viewModel })
    }
    
}
