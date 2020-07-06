//
//  AddGoalViewModel.swift
//  LifeGoalCountdownApp
//
//  Created by Johana Šlechtová on 06/07/2020.
//  Copyright © 2020 Jan Podmolík. All rights reserved.
//

import Foundation

final class AddGoalViewModel {
    
    var coordinator: AddGoalCoordinator?
    
    func viewDidDisappear() {
        coordinator?.didFinishAddEvent()
    }
    
    deinit {
        print("DEBUG: Deinit from \(self)")
    }
}
