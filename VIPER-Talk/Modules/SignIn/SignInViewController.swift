//
//  SignInViewController.swift
//  VIPER-Talk
//
//  Created by Nick on 5/13/20.
//  Copyright © 2020 co.Kcin.Nil. All rights reserved.
//

import UIKit

final class SignInViewController: UIViewController {
    
    var presenter: SignInPresenterProtocol?
    
    private
    let usernameTextField: UITextField = UITextField()
    private
    let passwordTextField: UITextField = UITextField()
    private
    lazy var confirmButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        button.setTitle("Sign In", for: .normal)
        button.addTarget(self, action: #selector(self.didTap(confirm:)), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private
    func setupUI() {
        view.backgroundColor = .white
        
        usernameTextField.borderStyle = .roundedRect
        passwordTextField.borderStyle = .roundedRect

        view.addSubview(usernameTextField)
        view.addSubview(passwordTextField)
        view.addSubview(confirmButton)
        
        usernameTextField
            .mLayChainSafe(pin: .init(top: 50, leading: 32, trailing: 32))
            .mLayChain(.height, 50)
        
        passwordTextField
            .mLayChainSafe(pin: .init(leading: 32, trailing: 32))
            .mLayChain(.height, 50)
            .mLayChain(.top, .equal, usernameTextField, .bottom, constant: 40)
        
        confirmButton
            .mLayChainSafe(pin: .init(leading: 32, trailing: 32))
            .mLayChain(.top, .equal, passwordTextField, .bottom, constant: 80)
            .mLayChain(.height, 50)
    }
    
    @objc
    private
    func didTap(confirm button: UIButton) {
        presenter?.confirm(name: usernameTextField.text, password: passwordTextField.text)
    }
    
}

// PRESENTER -> VIEW
extension SignInViewController: SignInViewProtocol {
    
    func showLoading() {
        view.showProgress()
    }
    
    func dismissLoading() {
        view.hiddenProgress()
    }
    
    func showError(message: String) {
        AlertHelper.shared.show(title: message)
    }

}
