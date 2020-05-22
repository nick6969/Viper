//
//  TodoListViewController.swift
//  VIPER-Talk
//
//  Created by Nick on 5/21/20.
//  Copyright © 2020 co.Kcin.Nil. All rights reserved.
//

import UIKit

final class TodoListViewController: UIViewController {
    
    var presenter: TodoListViewToPresenterProtocol!
    
    private
    lazy var tableView: UITableView = {
        let tableView: UITableView = UITableView(frame: .zero, style: .plain)
        tableView.registerCell(type: TodoListTableViewCell.self)
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.bounces = false
        tableView.backgroundColor = .clear
        tableView.rowHeight = UITableView.automaticDimension
        tableView.isScrollEnabled = false
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter.loadTodoList()
    }
    
    private
    func setupUI() {
        view.backgroundColor = .white
        title = "TODO List"
        view.addSubview(tableView)
        tableView.mLaySafe(pin: .allZero)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTap(add:)))
    }
    
    @objc
    private
    func didTap(add button: UIBarButtonItem) {
        presenter.addTodoList()
    }
}

// PRESENTER -> VIEW
extension TodoListViewController: TodoListPresenterToViewProtocol {

    func showLoading() {
        view.showProgress()
    }
    
    func dismissLoading() {
        view.hiddenProgress()
    }
    
    func showMessage(_ message: String) {
        AlertHelper.shared.show(title: message)
    }
    
    func loadDone() {
        tableView.reloadData()
    }
    
}

extension TodoListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfItem(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: TodoListTableViewCell.self)
        let model = presenter.modelAt(indexPath: indexPath)
        cell.setup(model: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter.didSelect(indexPath)
    }
    
}
