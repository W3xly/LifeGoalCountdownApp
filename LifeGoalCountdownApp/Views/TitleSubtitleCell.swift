//
//  TitleSubtitleCell.swift
//  LifeGoalCountdownApp
//
//  Created by Johana Šlechtová on 06/07/2020.
//  Copyright © 2020 Jan Podmolík. All rights reserved.
//

import UIKit

final class TitleSubtitleCell: UITableViewCell {
    private let title = UILabel()
    private let subtititleTextField = UITextField()
    private let verticalStackView = UIStackView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(with viewModel: TitleSubtitleCellViewModel) {
        title.text = viewModel.title
        subtititleTextField.text = viewModel.subtitle
        subtititleTextField.placeholder = viewModel.placeholder
    }
    
    private func setupViews() {
        verticalStackView.axis = .vertical
        title.font = .systemFont(ofSize: 22, weight: .medium)
        subtititleTextField.font = .systemFont(ofSize: 20, weight: .medium)
        
    }
    
    private func setupHierarchy() {
        addSubview(verticalStackView)
        verticalStackView.addArrangedSubview(title)
        verticalStackView.addArrangedSubview(subtititleTextField)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            verticalStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            verticalStackView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            verticalStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            verticalStackView.rightAnchor.constraint(equalTo: contentView.rightAnchor)
        ])
    }
}
