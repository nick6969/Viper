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
        usernameTextField.delegate = self
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.delegate = self
        
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
        
        confirmButton.alpha = 0.5
        confirmButton.isEnabled = false
    }
    
    @objc
    private
    func didTap(confirm button: UIButton) {
        
        presenter?.send(
            name: usernameTextField.text,
            password: passwordTextField.text
        )
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
    
    func showMessage(_ message: String) {
        AlertHelper.shared.show(title: message)
    }

    func sendButtonStatus(enabled: Bool) {
        confirmButton.isEnabled = enabled
        confirmButton.alpha = enabled ? 1.0 : 0.5
    }
    
}

extension SignInViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        guard let currentText = textField.text else { return false }

        let prospectiveText = (currentText as NSString).replacingCharacters(in: range, with: string)
        
        let username: String?
        let password: String?
        if textField == usernameTextField {
            username = prospectiveText
            password = passwordTextField.text
        } else {
            username = usernameTextField.text
            password = prospectiveText
        }
        
        presenter?.check(name: username, password: password)

        return true
    }
    
}
