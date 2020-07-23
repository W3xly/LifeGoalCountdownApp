//
//  AddGoalCoordinator.swift
//  LifeGoalCountdownApp
//
//  Created by Johana Šlechtová on 05/07/2020.
//  Copyright © 2020 Jan Podmolík. All rights reserved.
//

import UIKit

final class AddGoalCoordinator: Coordinator {
    
    private(set) var childCoordinators: [Coordinator] = []
    private let navigationController: UINavigationController
    
    var parentCoordinator: GoalListCoordinator?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let modalNavigationController = UINavigationController()
        let addGoalViewController: AddGoalViewController = .instantiate()
        modalNavigationController.setViewControllers([addGoalViewController], animated: false)
        let addGoalViewModel = AddGoalViewModel()
        addGoalViewModel.coordinator = self
        addGoalViewController.viewModel = addGoalViewModel
        navigationController.present(modalNavigationController, animated: true, completion: nil)
    }
    
    func didFinishAddGoal() {
        parentCoordinator?.childDidFinish(self)
    }
}
