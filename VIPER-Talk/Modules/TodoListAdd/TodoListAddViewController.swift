//
//  TodoListAddViewController.swift
//  VIPER-Talk
//
//  Created by Nick on 5/22/20.
//  Copyright © 2020 co.Kcin.Nil. All rights reserved.
//

import UIKit

final class TodoListAddViewController: UIViewController {
    
    var presenter: TodoListAddViewToPresenterProtocol!
    
    private
    var date: Date? {
        didSet {
            guard let date = date else { return }
            dateTextField.text = DateFormatter.default.string(from: date)
        }
    }
    
    private
    lazy var dateTextField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.inputView = datePicker
        tf.inputAccessoryView = toolBar
        return tf
    }()

    private
    lazy var titleTextField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.placeholder = "Title"
        tf.inputAccessoryView = toolBar
        return tf
    }()

    private
    lazy var descriptionTextField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.placeholder = "Description"
        tf.inputAccessoryView = toolBar
        return tf
    }()

    private
    lazy var datePicker: UIDatePicker = {
        let picker: UIDatePicker = UIDatePicker()
        picker.datePickerMode = .date
        picker.addTarget(self, action: #selector(pickerValueChange(_:)), for: .valueChanged)
        return picker
    }()

    private
    lazy var toolBar: UIToolbar = {
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 50))
        toolBar.barStyle = UIBarStyle.default
        toolBar.items = [
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil),
            UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(didTapToolBar(done:)))
        ]
        return toolBar
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private
    func setupUI() {
        view.backgroundColor = .white
        title = "Add"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(didTap(done:)))
        
        view.addSubview(dateTextField)
        view.addSubview(titleTextField)
        view.addSubview(descriptionTextField)

        dateTextField
            .mLayChainSafe(pin: .init(top: 50, leading: 32, trailing: 32))
            .mLayChain(.height, 50)
        
        titleTextField
            .mLayChainSafe(pin: .init(leading: 32, trailing: 32))
            .mLayChain(.height, 50)
            .mLayChain(.top, .equal, dateTextField, .bottom, constant: 40)

        descriptionTextField
            .mLayChainSafe(pin: .init(leading: 32, trailing: 32))
            .mLayChain(.height, 50)
            .mLayChain(.top, .equal, titleTextField, .bottom, constant: 40)

    }
    
    @objc
    private
    func didTap(done button: UIBarButtonItem) {
        presenter.addTodoList(title: titleTextField.text,
                              description: descriptionTextField.text,
                              date: date)
    }
    
    @objc
    private
    func pickerValueChange(_ sender: UIDatePicker) {
        date = sender.date
    }
    
    @objc
    private
    func didTapToolBar(done: UIBarButtonItem) {
        view.endEditing(true)
    }
}

// PRESENTER -> VIEW
extension TodoListAddViewController: TodoListAddPresenterToViewProtocol {
    
    func showMessage(_ message: String) {
        AlertHelper.shared.show(title: message)
    }

}
