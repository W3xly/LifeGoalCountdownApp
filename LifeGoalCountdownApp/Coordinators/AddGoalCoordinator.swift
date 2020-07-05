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
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = UIViewController()
        viewController.view.backgroundColor = .red
        navigationController.present(viewController, animated: true, completion: nil)
    }
}
