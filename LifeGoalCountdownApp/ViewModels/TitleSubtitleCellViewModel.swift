//
//  TitleSubtitleCellViewModel.swift
//  LifeGoalCountdownApp
//
//  Created by Johana Šlechtová on 06/07/2020.
//  Copyright © 2020 Jan Podmolík. All rights reserved.
//

import UIKit

final class TitleSubtitleCellViewModel {
    
    enum CellType {
        case text
        case date
        case image
    }
    
    let title: String
    private(set) var subtitle: String
    private(set) var onCellUpdate: (() -> Void)? = {}
    
    let placeholder: String
    let type: CellType
        
    lazy var dateFormatted: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "dd.MM.yyy"
        return df
    }()
    
    init(title: String, subtitle: String, placeholder: String, type: CellType, onCellUpdate: (() -> Void)?) {
        self.title = title
        self.subtitle = subtitle
        self.placeholder = placeholder
        self.type = type
        self.onCellUpdate = onCellUpdate
    }
    
    func update(_ subtitle: String) {
        self.subtitle = subtitle
    }
    
    func update(_ date: Date) {
        print("DEBUG: 123")
        let dateString = dateFormatted.string(from: date)
        self.subtitle = dateString
        onCellUpdate?() // reload data
    }
    
    func shouldHideImage() -> Bool {
        type != .image
    }
    func shouldHideTextField() -> Bool {
        type == .image
    }
    
    func setSpacing() -> CGFloat {
        type == .image ? 15 : 0
    }
}
