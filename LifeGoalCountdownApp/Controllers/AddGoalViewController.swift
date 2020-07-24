//
//  AddGoalViewController.swift
//  LifeGoalCountdownApp
//
//  Created by Johana Šlechtová on 05/07/2020.
//  Copyright © 2020 Jan Podmolík. All rights reserved.
//

import UIKit

class AddGoalViewController: UIViewController {
    
    //MARK: - Properties
    
    @IBOutlet weak var tableView: UITableView!
    var viewModel: AddGoalViewModel!
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.onUpdate = { [weak self] in
            self?.tableView.reloadData()
        }
        viewModel.viewDidLoad()
        setupViews()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        viewModel.viewDidDisappear()
    }
    
    //MARK: - Selectors
    
    @objc func tappedDone() {
        viewModel.tappedDone()
    }
    
    //MARK: - Helpers
    
    private func setupViews() {
        tableView.dataSource = self
        tableView.register(TitleSubtitleCell.self, forCellReuseIdentifier: "TitleSubtitleCell")
        tableView.tableFooterView = UIView()
        setupTitle()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(tappedDone))
        navigationController?.navigationBar.tintColor = .black
    }
    
    private func setupTitle() {
        navigationItem.title = viewModel.title
        navigationController?.navigationBar.prefersLargeTitles = true
        // to force large titles
        tableView.contentInsetAdjustmentBehavior = .never // normaly works just prefersLargeTitles
        tableView.setContentOffset(.init(x: 0, y: -1), animated: false) // here We need these two lines
    }
}

extension AddGoalViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellViewModel = viewModel.cell(for: indexPath)
        switch cellViewModel {
            case .titleSubtitle(let titleSubtitleCellViewModel):
                let cell = tableView.dequeueReusableCell(withIdentifier: "TitleSubtitleCell", for: indexPath) as! TitleSubtitleCell
                cell.update(with: titleSubtitleCellViewModel)
                // delegate -> func shouldChangeCharactersIn -> Set text in viewmodel and avoid reusing cell (clearing text)
                cell.subtitleTextField.delegate = self
                return cell
            case .titleImage:
                return UITableViewCell()
        }
    }
}

//MARK: - UITextFieldDelegate

// Keep texfield populated event if cell deallocates after scroll
extension AddGoalViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let currentText = textField.text else { return false }
        let text = currentText + string
        let point = textField.convert(textField.bounds.origin, to: tableView)
        if let indexPath = tableView.indexPathForRow(at: point) {
            viewModel.updateCell(indexPath: indexPath, subtitle: text)
        }
        return true
    }
}
