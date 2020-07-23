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
        
        tableView.dataSource = self
        tableView.register(TitleSubtitleCell.self, forCellReuseIdentifier: "TitleSubtitleCell")
        viewModel.onUpdate = { [weak self] in
            self?.tableView.reloadData()
        }
        viewModel.viewDidLoad()
        
        navigationItem.title = viewModel.title
        navigationController?.navigationBar.prefersLargeTitles = true
        // to force large titles
        tableView.contentInsetAdjustmentBehavior = .never // normaly works just prefersLargeTitles
        tableView.setContentOffset(.init(x: 0, y: -1), animated: false) // here We need these two lines
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(tappedDone))
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        viewModel.viewDidDisappear()
    }
    
    //MARK: - Selectors
    
    @objc func tappedDone() {
        viewModel.tappedDone()
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
                return cell
            case .titleImage:
                return UITableViewCell()
        }
        
    }
}
