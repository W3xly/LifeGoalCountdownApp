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
    private var modalNavigationController: UINavigationController? // For Image picker Coordinator
    var parentCoordinator: GoalListCoordinator?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        self.modalNavigationController = UINavigationController()
        let addGoalViewController: AddGoalViewController = .instantiate()
        modalNavigationController?.setViewControllers([addGoalViewController], animated: false)
        let addGoalViewModel = AddGoalViewModel()
        addGoalViewModel.coordinator = self
        addGoalViewController.viewModel = addGoalViewModel
        if let modalNavigationController = modalNavigationController {
            navigationController.present(modalNavigationController, animated: true, completion: nil)
        }
    }
    
    func didFinishAddGoal() {
        parentCoordinator?.childDidFinish(self)
    }
    
    func showImagePicker(completion: @escaping(UIImage) -> Void) {
        guard let modalNavigationController = modalNavigationController else { return }
        let imagePickerCoordinator = ImagePickerCoordinator(navigationController: modalNavigationController)
        childCoordinators.append(imagePickerCoordinator)
        imagePickerCoordinator.start()
    }
    
    func didFinishPicking(_ image: UIImage) {
        
    }
}
