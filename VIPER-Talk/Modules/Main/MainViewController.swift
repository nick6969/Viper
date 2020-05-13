//
//  MainViewController.swift
//  VIPER-Talk
//
//  Created by Nick on 5/6/20.
//  Copyright © 2020 co.Kcin.Nil. All rights reserved.
//

import UIKit

final class MainViewController: UIViewController, MainViewProtocol {
    
    var presenter: MainPresenterProtocol?
    
    private
    lazy var buttonClosure: ( (String) -> UIButton) = { title in
        let button = UIButton()
        button.backgroundColor = .blue
        button.setTitle( title, for: .normal)
        button.addTarget(self, action: #selector(self.didTap(button:)), for: .touchUpInside)
        return button
    }
    
    private
    lazy var signUpButton: UIButton = buttonClosure("Sign Up")
    lazy var signInButton: UIButton = buttonClosure("Sign In")

    private
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.addArrangedSubview(self.signInButton)
        stackView.addArrangedSubview(self.signUpButton)
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(stackView)
        stackView.mLaySafe(pin: .init(top: 10, leading: 10, bottom: 10, trailing: 10))

    }
    
    @objc
    private
    func didTap(button: UIButton) {
        switch button {
        case signInButton:
            presenter?.pushToSignIn()
        case signUpButton:
            presenter?.pushToSignIn()
        default:
            break
        }
    }
    
}
