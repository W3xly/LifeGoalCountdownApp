//
//  GoalListCoordinator.swift
//  LifeGoalCountdownApp
//
//  Created by Johana Šlechtová on 28/06/2020.
//  Copyright © 2020 Jan Podmolík. All rights reserved.
//

import UIKit

final class GoalListCoordinator: Coordinator {
    
    private(set) var childCoordinators: [Coordinator] = []
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        // setup goalListViewController as rootViewController in navigationController
        // always setup in storyboard!
        let goalListViewController = GoalListViewController.instantiate() // connection to storyboard
        let goalListViewModel = GoalListViewModel()
        goalListViewModel.coordinator = self
        goalListViewController.viewModel = goalListViewModel
        navigationController.setViewControllers([goalListViewController], animated: false)
    }
    
    func startAddGoal() {
        let addGoalCoordinator = AddGoalCoordinator(navigationController: navigationController)
        childCoordinators.append(addGoalCoordinator)
        addGoalCoordinator.start()
    }
}
