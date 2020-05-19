//
//  CategotyViewController.swift
//  VIPER-Talk
//
//  Created by Nick on 5/15/20.
//  Copyright © 2020 co.Kcin.Nil. All rights reserved.
//

import UIKit

final class CategoryViewController: UIViewController {
    
    var presenter: CategoryPresenterProtocol?
    
    private
    lazy var tableView: UITableView = {
        let tableView: UITableView = UITableView(frame: .zero, style: .plain)
        tableView.registerCell(type: UITableViewCell.self)
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.bounces = false
        tableView.backgroundColor = .clear
        tableView.rowHeight = 68
        tableView.isScrollEnabled = false
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter?.loadCategory()
    }
    
    private
    func setupUI() {
        view.backgroundColor = .white
        title = "Category"
        view.addSubview(tableView)
        tableView.mLaySafe(pin: .allZero)
    }

}

// PRESENTER -> VIEW
extension CategoryViewController: CategoryViewProtocol {

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

extension CategoryViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfItem(in: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: UITableViewCell.self)
        
        guard let model = presenter?.modelAt(index: indexPath.row) else {
            return cell
        }
        
        cell.textLabel?.text = model.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter?.didSelect(indexPath)
    }
    
}
