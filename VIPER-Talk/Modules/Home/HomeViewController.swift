//
//  HomeViewController.swift
//  VIPER-Talk
//
//  Created by Nick on 5/14/20.
//  Copyright © 2020 co.Kcin.Nil. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {
    
    var presenter: HomeViewToPresenterProtocol!
    
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
        presenter.loadBranch()
    }
    
    private
    func setupUI() {
        view.backgroundColor = .white
        title = "Home"
        view.addSubview(tableView)
        tableView.mLaySafe(pin: .allZero)
    }
    
}

// PRESENTER -> VIEW
extension HomeViewController: HomePresenterToViewProtocol {

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

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfItem(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: UITableViewCell.self)

        let model = presenter.modelAt(index: indexPath.row)
        
        cell.textLabel?.text = model.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter.didSelect(indexPath)
    }
        
}
