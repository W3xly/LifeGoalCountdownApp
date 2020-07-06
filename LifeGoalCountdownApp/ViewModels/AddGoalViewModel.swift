//
//  AddGoalViewModel.swift
//  LifeGoalCountdownApp
//
//  Created by Johana Šlechtová on 06/07/2020.
//  Copyright © 2020 Jan Podmolík. All rights reserved.
//

import UIKit

final class AddGoalViewModel {
    
    var onUpdate: () -> Void = {}
    
    enum Cell {
        case titleSubtitle(TitleSubtitleCellViewModel)
        case titleImage
    }
    
    private(set) var cells: [AddGoalViewModel.Cell] = []
    var coordinator: AddGoalCoordinator?
    
    func viewDidLoad() {
        cells = [
            .titleSubtitle(TitleSubtitleCellViewModel(title: "Name", subtitle: "", placeholder: "Add any goal")),
            .titleSubtitle(TitleSubtitleCellViewModel(title: "Date", subtitle: "", placeholder: "Achieve to")),
        ]
        onUpdate()
    }
    
    func viewDidDisappear() {
        coordinator?.didFinishAddEvent()
    }
    
    func numberOfRowsInSection() -> Int {
        return cells.count
    }
    
    func cell(for IndexPath: IndexPath) -> Cell {
        return cells[IndexPath.row]
    }
}
