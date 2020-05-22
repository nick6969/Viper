//
//  MainViewController.swift
//  VIPER-Talk
//
//  Created by Nick on 5/14/20.
//  Copyright © 2020 co.Kcin.Nil. All rights reserved.
//

import UIKit

final class MainViewController: UIViewController {
    
    var presenter: MainViewToPresenterProtocol!
    
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
    lazy var todoListButton: UIButton = buttonClosure("Go to Todo List")

    private
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.addArrangedSubview(self.signInButton)
        stackView.addArrangedSubview(self.signUpButton)
        stackView.addArrangedSubview(self.todoListButton)
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
            presenter.pushToSignIn()
        case signUpButton:
            presenter.pushToSignUp()
        case todoListButton:
            presenter.pushToTodoList()
        default:
            break
        }
    }

}

// PRESENTER -> VIEW
extension MainViewController: MainPresenterToViewProtocol {

}
