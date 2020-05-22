//
//  TodoListTableViewCell.swift
//  VIPER-Talk
//
//  Created by Nick on 5/22/20.
//  Copyright © 2020 co.Kcin.Nil. All rights reserved.
//

import UIKit

final class TodoListTableViewCell: UITableViewCell {
    
    private let dateLabel: UILabel = {
        let label: UILabel = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textColor = .red
        label.numberOfLines = 1
        return label
    }()

    private let titleLabel: UILabel = {
        let label: UILabel = UILabel()
        label.font = .systemFont(ofSize: 20)
        label.textColor = .blue
        label.numberOfLines = 1
        return label
    }()

    private let descriptionLabel: UILabel = {
        let label: UILabel = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private
    func setupUI() {
        contentView.addSubview(dateLabel)
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
        
        dateLabel
            .mLayChain(pin: .init(top: 16, leading: 16, trailing: 16))
        
        titleLabel
            .mLayChain(pin: .init(leading: 16, trailing: 16))
            .mLayChain(.top, .equal, dateLabel, .bottom, constant: 10)
        
        descriptionLabel
            .mLayChain(pin: .init(leading: 16, bottom: 16, trailing: 16))
            .mLayChain(.top, .equal, titleLabel, .bottom, constant: 10)
        
    }
    
    func setup(model: TodoListViewModel) {
        dateLabel.text = model.date
        titleLabel.text = model.title
        descriptionLabel.text = model.description
    }
}
