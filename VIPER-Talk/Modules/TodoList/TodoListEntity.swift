//
//  TodoListEntity.swift
//  VIPER-Talk
//
//  Created by Nick on 5/21/20.
//  Copyright © 2020 co.Kcin.Nil. All rights reserved.
//

import Foundation

struct TodoListModel: Codable {
    let identifiter: String
    let date: Date
    let title: String
    let description: String
    let createAt: Date
    let updateAt: Date
    
    var viewModel: TodoListViewModel {
        return .init(identifiter: identifiter,
                     date: DateFormatter.default.string(from: date),
                     title: title,
                     description: description)
    }
    
}

struct TodoListViewModel {
    let identifiter: String
    let date: String
    let title: String
    let description: String
}
