//
//  TodoListAddInteractor.swift
//  VIPER-Talk
//
//  Created by Nick on 5/22/20.
//  Copyright © 2020 co.Kcin.Nil. All rights reserved.
//

import Foundation

final class TodoListAddInteractor {
    
    unowned var presenter: TodoListAddInteractorToPresenterProtocol!
    
}

// Presenter -> Interactor
extension TodoListAddInteractor: TodoListAddPresenterToInteractorProtocol {
    
    func addTodoList(title: String?, description: String?, date: Date?) {
        guard let title = title, !title.isEmpty else {
            presenter.addFailure(error: TodoListAddError.noTitle)
            return
        }
        guard let description = description, !description.isEmpty else {
            presenter.addFailure(error: TodoListAddError.noDescription)
            return
        }
        guard let date = date else {
            presenter.addFailure(error: TodoListAddError.noDate)
            return
        }

        let now: Date = Date()
        let model = TodoListModel(identifiter: UUID().uuidString,
                                  date: date,
                                  title: title,
                                  description: description,
                                  createAt: now,
                                  updateAt: now)
        
        Cache.addTodoList(model)
        presenter.addDone(model: model)
    }
    
}

enum TodoListAddError: Swift.Error {
    case noTitle
    case noDescription
    case noDate
}

extension TodoListAddError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .noTitle:
            return "input title is empty."
        case .noDescription:
            return "input description is empty."
        case .noDate:
            return "input date is empty."
        }
    }
}
