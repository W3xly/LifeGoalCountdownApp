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
        let addGoalViewController: AddGoalViewController = .instantiate()
        let addGoalViewModel = AddGoalViewModel()
        addGoalViewModel.coordinator = self
        addGoalViewController.viewModel = addGoalViewModel
        navigationController.present(addGoalViewController, animated: true, completion: nil)
    }
    
    func didFinishAddEvent() {
        parentCoordinator?.childDidFinish(self)
    }
    
    deinit {
        print("DEBUG: Deinit from \(self)")
    }
}
