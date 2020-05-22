//
//  TodoListProtocols.swift
//  VIPER-Talk
//
//  Created by Nick on 5/21/20.
//  Copyright © 2020 co.Kcin.Nil. All rights reserved.
//

import UIKit

// MARK: Presenter -> Router
protocol TodoListPresenterToRouterProtocol: AnyObject {
    func pushToAddTodoList()
}

// MARK: Router -> Presenter
protocol TodoListRouterToPresenterProtocol: AnyObject {
    func addNewTodoList(model: TodoListModel)
}

// MARK: Presenter -> View
protocol TodoListPresenterToViewProtocol: UIViewController {    
    func showLoading()
    func dismissLoading()
    func showMessage(_ message: String)
    func loadDone()
}

// MARK: View -> Presenter
protocol TodoListViewToPresenterProtocol: AnyObject {
    func loadTodoList()
    func addTodoList()
    
    func numberOfItem(in section: Int) -> Int
    func modelAt(indexPath: IndexPath) -> TodoListViewModel
    func didSelect(_ indexPath: IndexPath)
}

// MARK: Presenter -> Interactor
protocol TodoListPresenterToInteractorProtocol: AnyObject {    
    func loadTodoList()
    func addNewTodoList(model: TodoListModel)
}

// MARK: Interactor -> Presenter
protocol TodoListInteractorToPresenterProtocol: AnyObject {
    func loadTodoListSuccess(models: [TodoListViewModel])
    func loadTodoListFailure(error: Error?)
}
