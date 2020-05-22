//
//  TodoListAddProtocols.swift
//  VIPER-Talk
//
//  Created by Nick on 5/22/20.
//  Copyright © 2020 co.Kcin.Nil. All rights reserved.
//

import UIKit

// MARK: Presenter -> Router
protocol TodoListAddPresenterToRouterProtocol: AnyObject {
    func addDone(model: TodoListModel)
}

// MARK: Router -> Presenter
protocol TodoListAddRouterToPresenterProtocol: AnyObject {

}

// MARK: Presenter -> View
protocol TodoListAddPresenterToViewProtocol: UIViewController {    
    func showMessage(_ message: String)
}

// MARK: View -> Presenter
protocol TodoListAddViewToPresenterProtocol: AnyObject {
    func addTodoList(title: String?, description: String?, date: Date?)
}

// MARK: Presenter -> Interactor
protocol TodoListAddPresenterToInteractorProtocol: AnyObject {
    func addTodoList(title: String?, description: String?, date: Date?)
}

// MARK: Interactor -> Presenter
protocol TodoListAddInteractorToPresenterProtocol: AnyObject {
    func addDone(model: TodoListModel)
    func addFailure(error: Error)
}

// MARK: Router -> Previous Router
protocol TodoListAddDelegate: AnyObject {
    func addNewTodoList(model: TodoListModel)
}
