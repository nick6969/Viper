//
//  MainInteractor.swift
//  VIPER-Talk
//
//  Created by Nick on 5/14/20.
//  Copyright © 2020 co.Kcin.Nil. All rights reserved.
//

import Foundation

final class MainInteractor {
    
    weak var presenter: MainOutputInteractorProtocol?
    
}

// Presenter -> Interactor
extension MainInteractor: MainInputInteractorProtocol {

}
