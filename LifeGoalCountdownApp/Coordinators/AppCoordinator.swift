//
//  AppCoordinator.swift
//  LifeGoalCountdownApp
//
//  Created by Johana Šlechtová on 28/06/2020.
//  Copyright © 2020 Jan Podmolík. All rights reserved.
//

import UIKit

// if I don't retain the appCoordinator then it will be instantly deallocated (Testable by deinit block.) I need the scene delegate to hold onto it to stop this happening..

protocol Coordinator: class {
    // Append every new coordinator to this array - Retain coordinator, saves from immediately dealocation
    var childCoordinators: [Coordinator] { get }
    func start()
}

final class AppCoordinator: Coordinator {
    private(set) var childCoordinators: [Coordinator] = []
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        // Don't have window reference -> solution is to pass from scene delegate
        let navigationController = UINavigationController()
        
        let goalListCoordinator = GoalListCoordinator(navigationController: navigationController)
        
        // Need to append to avoid deallocation & start
        childCoordinators.append(goalListCoordinator)
        goalListCoordinator.start()
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
    }
}
