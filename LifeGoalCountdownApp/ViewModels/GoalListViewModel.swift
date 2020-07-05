//
//  GoalListViewModel.swift
//  LifeGoalCountdownApp
//
//  Created by Johana Šlechtová on 05/07/2020.
//  Copyright © 2020 Jan Podmolík. All rights reserved.
//

import Foundation

final class GoalListViewModel {
    
    let title = "Your life goals!"
    var coordinator: GoalListCoordinator?
    
    func tappedAddGoal() {
        // reference to coordinator
        coordinator?.startAddGoal()
    }
}
