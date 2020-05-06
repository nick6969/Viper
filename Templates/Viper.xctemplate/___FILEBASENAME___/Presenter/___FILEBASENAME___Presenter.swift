//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

final class ___VARIABLE_productName:identifier___Presenter: ___VARIABLE_productName:identifier___PresenterProtocol {
    
    private weak var view: ___VARIABLE_productName:identifier___ViewProtocol?
    var interactor: ___VARIABLE_productName:identifier___InputInteractorProtocol?
    private let router: ___VARIABLE_productName:identifier___RouterProtocol
    
    init(view: ___VARIABLE_productName:identifier___ViewProtocol, interactor: ___VARIABLE_productName:identifier___InputInteractorProtocol, router: ___VARIABLE_productName:identifier___RouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension ___VARIABLE_productName:identifier___Presenter: ___VARIABLE_productName:identifier___OutputInteractorProtocol {
    // Interactor -> Presenter
}
