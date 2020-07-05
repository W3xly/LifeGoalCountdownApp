//
//  GoalListViewController.swift
//  LifeGoalCountdownApp
//
//  Created by Johana Šlechtová on 28/06/2020.
//  Copyright © 2020 Jan Podmolík. All rights reserved.
//

import UIKit

class GoalListViewController: UIViewController {
    
    var viewModel: GoalListViewModel!
        
    static func instantiate() -> GoalListViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        // Setup Identifier in storyboard
        let controller = storyboard.instantiateViewController(withIdentifier: "GoalListViewController") as! GoalListViewController
        return controller
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //MARK: - Actions
    
    @objc private func tappedAddGoalButton() {
        viewModel.tappedAddGoal()
    }
    
    //MARK: - Helpers
    
    func configureUI() {
        let image = UIImage(systemName: "plus.circle.fill")
        let barButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(tappedAddGoalButton))
        barButtonItem.tintColor = .primary
        navigationItem.rightBarButtonItem = barButtonItem
        navigationItem.title = viewModel.title
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
