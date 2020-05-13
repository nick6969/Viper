//
//  ValidateType.swift
//  VIPER-Talk
//
//  Created by Nick on 5/14/20.
//  Copyright © 2020 co.Kcin.Nil. All rights reserved.
//

import Foundation

enum ValidateType: String {
    
    case username = "^([\\w.]{4,30})"
    
    case password = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{6,}$"
    
    case email = "^([a-zA-Z0-9_\\-\\.+!#$%^&*]+)@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.)|(([a-zA-Z0-9\\-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\\]?)$"
    
}

extension String {
    func validate(with type: ValidateType) -> Bool {
        return NSPredicate(format: "SELF MATCHES %@", type.rawValue).evaluate(with: self)
    }
}
