//
//  GoalListViewController.swift
//  LifeGoalCountdownApp
//
//  Created by Johana Šlechtová on 28/06/2020.
//  Copyright © 2020 Jan Podmolík. All rights reserved.
//

import UIKit
import CoreData

class GoalListViewController: UIViewController {
    
    private let coreDataManager = CoreDataManager()
    
    static func instantiate() -> GoalListViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        // Setup Identifier in storyboard
        let controller = storyboard.instantiateViewController(withIdentifier: "GoalListViewController") as! GoalListViewController
        return controller
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
        coreDataManager.saveGoal(name: "New Years", date: Date(), image: #imageLiteral(resourceName: "clock"))
        print("DEBUG: Fetch Result: \(coreDataManager.fetchGoals())")
    }
    
    //MARK: - Actions
    
    @objc private func tappedRightBarButton() {
        print("DEBUG: Tapped right bar button item..")
    }
    
    //MARK: - Helpers
    
    func configureUI() {
        let image = UIImage(systemName: "plus.circle.fill")
        let barButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(tappedRightBarButton))
        barButtonItem.tintColor = .primary
        navigationItem.rightBarButtonItem = barButtonItem
        navigationItem.title = "Your Life Goals"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
