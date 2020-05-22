//
//  TodoListPresenter.swift
//  VIPER-Talk
//
//  Created by Nick on 5/21/20.
//  Copyright © 2020 co.Kcin.Nil. All rights reserved.
//

import Foundation

final class TodoListPresenter {
    
    private unowned var view: TodoListPresenterToViewProtocol!
    private let interactor: TodoListPresenterToInteractorProtocol
    private let router: TodoListPresenterToRouterProtocol
    
    private var models: [TodoListViewModel] = []
    
    init(_ view: TodoListPresenterToViewProtocol, 
         _ interactor: TodoListPresenterToInteractorProtocol, 
         _ router: TodoListPresenterToRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

// View -> Presenter
extension TodoListPresenter: TodoListViewToPresenterProtocol {
    func loadTodoList() {
        interactor.loadTodoList()
    }
    
    func addTodoList() {
        router.pushToAddTodoList()
    }
    
    func numberOfItem(in section: Int) -> Int {
        return models.count
    }
    
    func modelAt(indexPath: IndexPath) -> TodoListViewModel {
        return models[indexPath.row]
    }
    
    func didSelect(_ indexPath: IndexPath) {
        let model = modelAt(indexPath: indexPath)
        view.showMessage(model.title)
    }
    
}

// Interactor -> Presenter
extension TodoListPresenter: TodoListInteractorToPresenterProtocol {
    
    func loadTodoListSuccess(models: [TodoListViewModel]) {
        view.dismissLoading()
        self.models = models
        view.loadDone()
    }
    
    func loadTodoListFailure(error: Error?) {
        let message = error?.localizedDescription ?? "Error"
        view.dismissLoading()
        view.showMessage(message)
    }
    
}

// Router -> Presenter
extension TodoListPresenter: TodoListRouterToPresenterProtocol {
    
    func addNewTodoList(model: TodoListModel) {
        interactor.addNewTodoList(model: model)
    }
    
}
