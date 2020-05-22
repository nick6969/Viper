//
//  Cache.swift
//  VIPER-Talk
//
//  Created by Nick on 5/22/20.
//  Copyright © 2020 co.Kcin.Nil. All rights reserved.
//

import Foundation

@propertyWrapper
struct DefaultCodable<T: Codable> {
    let key: String
    var wrappedValue: T? {
        get {
            guard let data = UserDefaults.standard.data(forKey: key) else { return nil }
            return try? JSONDecoder().decode(T.self, from: data)
        }
        set {
            if let model = newValue {
                let data = try? JSONEncoder().encode(model)
                UserDefaults.standard.set(data, forKey: key)
            } else {
                UserDefaults.standard.set(nil, forKey: key)
            }
        }
    }
}

enum Cache {
    
    @DefaultCodable<[TodoListModel]>(key: "todoLists")
    static var todoLists: [TodoListModel]?
    
    static func addTodoList(_ model: TodoListModel) {
        var models = Cache.todoLists ?? []
        models.append(model)
        Cache.todoLists = models
    }
    
}
