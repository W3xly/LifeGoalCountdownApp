//
//  TitleSubtitleCell.swift
//  LifeGoalCountdownApp
//
//  Created by Johana Šlechtová on 06/07/2020.
//  Copyright © 2020 Jan Podmolík. All rights reserved.
//

import UIKit

final class TitleSubtitleCell: UITableViewCell {
    
    //MARK: - Properties
        
    private let titleLabel = UILabel()
    let subtitleTextField = UITextField()
    private let verticalStackView = UIStackView()
    private let constant: CGFloat = 15
    
    private let datePickerView = UIDatePicker()
    // Need to predefine frame, otherwise we get layout issues
    private let toolBar = UIToolbar(frame: .init(x: 0, y: 0, width: 100, height: 100))
    private lazy var doneButton: UIBarButtonItem =  {
        let button = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(tappedDone))
        return button
    }()
    
    private var viewModel: TitleSubtitleCellViewModel?
    
    //MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Selectors
    
    @objc private func tappedDone() {
        print("DEBUG: Confirm date..\(datePickerView.date)")
        viewModel?.update(datePickerView.date)
    }
    
    //MARK: - Helpers
    func update(with viewModel: TitleSubtitleCellViewModel) {
        self.viewModel = viewModel
        
        titleLabel.text = viewModel.title
        subtitleTextField.text = viewModel.subtitle
        subtitleTextField.placeholder = viewModel.placeholder
        subtitleTextField.inputView = viewModel.type == .text ? nil : datePickerView
        subtitleTextField.inputAccessoryView = viewModel.type == .text ? nil : toolBar
    }
    
    private func setupViews() {
        verticalStackView.axis = .vertical
        titleLabel.font = .systemFont(ofSize: 22, weight: .medium)
        subtitleTextField.font = .systemFont(ofSize: 20, weight: .medium)
        selectionStyle = .none
        
        [verticalStackView, titleLabel, subtitleTextField].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        toolBar.setItems([doneButton], animated: false)
        datePickerView.datePickerMode = .date // returns just date(not time)
    }
    
    private func setupHierarchy() {
        contentView.addSubview(verticalStackView)
        verticalStackView.addArrangedSubview(titleLabel)
        verticalStackView.addArrangedSubview(subtitleTextField)

    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            verticalStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: constant),
            verticalStackView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: constant),
            verticalStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -constant),
            verticalStackView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: constant)
        ])
    }
}
