//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

// MARK: Router
protocol ___VARIABLE_productName:identifier___RouterProtocol: AnyObject {
    // Presenter -> Router
}

// MARK: Presenter
protocol ___VARIABLE_productName:identifier___PresenterProtocol: AnyObject {
    //View -> Presenter
}

// MARK: Interactor Input
protocol ___VARIABLE_productName:identifier___InputInteractorProtocol: AnyObject {
    // Presenter -> Interactor
    var presenter: ___VARIABLE_productName:identifier___OutputInteractorProtocol? { get set }
}

// MARK: Interactor Output
protocol ___VARIABLE_productName:identifier___OutputInteractorProtocol: AnyObject {
    // Interactor -> Presenter
}

// MARK: View
protocol ___VARIABLE_productName:identifier___ViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: ___VARIABLE_productName:identifier___PresenterProtocol? { get set }
}
