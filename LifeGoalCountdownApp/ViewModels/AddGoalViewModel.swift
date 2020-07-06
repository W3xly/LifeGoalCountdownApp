//
//  AddGoalViewModel.swift
//  LifeGoalCountdownApp
//
//  Created by Johana Šlechtová on 06/07/2020.
//  Copyright © 2020 Jan Podmolík. All rights reserved.
//

import UIKit

final class AddGoalViewModel {
    
    enum Cell {
        case titleSubtitle(TitleSubtitleCellViewModel)
        case titleImage
    }
    
    var coordinator: AddGoalCoordinator?
    
    func viewDidDisappear() {
        coordinator?.didFinishAddEvent()
    }
}
