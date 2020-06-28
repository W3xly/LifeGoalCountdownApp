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
        navigationController.setViewControllers([goalListViewController], animated: false)
    }
}
