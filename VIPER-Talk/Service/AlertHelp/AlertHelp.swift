//
//  AlertHelp.swift
//  VIPER-Talk
//
//  Created by Nick on 5/14/20.
//  Copyright © 2020 co.Kcin.Nil. All rights reserved.
//

import UIKit

enum AlertActionStyle {
    case `default`
    case cancel
    case destructive
}

enum AlertControllerStyle {
    case actionSheet
    case alert
}

struct AlertAction {
    var title: String?
    var style: AlertActionStyle
    var handler: (() -> Void)?
}

extension UIAlertController {
    
    convenience init(title: String?, message: String?, customStyle: AlertControllerStyle) {
        let style: UIAlertController.Style
        switch customStyle {
        case .alert:
            style = .alert
        case .actionSheet:
            style = .actionSheet
        }
        self.init(title: title, message: message, preferredStyle: style)
    }
    
    func addCustomerAction(_ action: AlertAction, alertWindow: UIWindow) {
        let style: UIAlertAction.Style
        switch action.style {
        case .cancel:
            style = .cancel
        case .destructive:
            style = .destructive
        case .default:
            style = .default
        }
        let uiAction: UIAlertAction = UIAlertAction(title: action.title, style: style) { _ in
            action.handler?()
            alertWindow.isHidden = true
        }
        addAction(uiAction)
    }
    
    func present(with actions: [AlertAction]) {
        let alertWindow: UIWindow = UIWindow()
        if #available(iOS 13.0, *) {
            if let windowScene: UIWindowScene = (UIApplication.shared
                .connectedScenes
                .first { $0.activationState == .foregroundActive } as? UIWindowScene) {
                alertWindow.windowScene = windowScene
            }
        }
        alertWindow.backgroundColor = nil
        alertWindow.windowLevel = .alert
        alertWindow.rootViewController = UIViewController()
        alertWindow.isHidden = false
        
        actions.forEach { addCustomerAction($0, alertWindow: alertWindow) }
        alertWindow.rootViewController?.present(self, animated: true)
    }
    
}

final class AlertHelper {
    
    static let shared: AlertHelper = AlertHelper()
    
    func show(title: String?,
              message: String? = nil,
              style: AlertControllerStyle = .alert,
              actions: [AlertAction]) {
        DispatchQueue.main.async {
            UIAlertController(title: title,
                              message: message,
                              customStyle: style)
                .present(with: actions)
        }
    }
}
