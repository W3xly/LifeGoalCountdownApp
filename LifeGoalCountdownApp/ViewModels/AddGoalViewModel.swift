//
//  AddGoalViewModel.swift
//  LifeGoalCountdownApp
//
//  Created by Johana Šlechtová on 06/07/2020.
//  Copyright © 2020 Jan Podmolík. All rights reserved.
//

import UIKit

final class AddGoalViewModel {
    
    let title = "Add"
    var onUpdate: () -> Void = {}
    
    enum Cell {
        case titleSubtitle(TitleSubtitleCellViewModel)
    }
    
    private(set) var cells: [AddGoalViewModel.Cell] = []
    var coordinator: AddGoalCoordinator?
    
    func viewDidLoad() {
        cells = [
            .titleSubtitle(TitleSubtitleCellViewModel(title: "Name", subtitle: "", placeholder: "Add any goal", type: .text, onCellUpdate: {}
            )),
            .titleSubtitle(TitleSubtitleCellViewModel(title: "Date", subtitle: "", placeholder: "Achieve to", type: .date, onCellUpdate:  { [weak self] in
                self?.onUpdate()
                }
            )),
            .titleSubtitle(TitleSubtitleCellViewModel(title: "Background", subtitle: "", placeholder: "", type: .image, onCellUpdate:  { [weak self] in
                self?.onUpdate()
                }
            ))
        ]
        onUpdate()
    }
    
    func viewDidDisappear() {
        coordinator?.didFinishAddGoal()
    }
    
    func numberOfRowsInSection() -> Int {
        return cells.count
    }
    
    func cell(for IndexPath: IndexPath) -> Cell {
        return cells[IndexPath.row]
    }
    
    func tappedDone() {
        // Extract info from cell view models and save in coredata
        // Tell coordinator to dismiss
        print("DEBUG: Tapped done!")
    }
    
    func updateCell(indexPath: IndexPath, subtitle: String) {
        switch cells[indexPath.row] {
            case .titleSubtitle(let titleSubtitleCellViewModel):
                titleSubtitleCellViewModel.update(subtitle)
        }
    }
}
