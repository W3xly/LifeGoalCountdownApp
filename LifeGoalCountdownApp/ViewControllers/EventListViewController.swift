//
//  EventListViewController.swift
//  LifeGoalCountdownApp
//
//  Created by Johana Šlechtová on 28/06/2020.
//  Copyright © 2020 Jan Podmolík. All rights reserved.
//

import UIKit

class EventListViewController: UIViewController {
    
    static func instantiate() -> EventListViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        // Setup Identifier in storyboard
        let controller = storyboard.instantiateViewController(withIdentifier: "EventListViewController") as! EventListViewController
        return controller
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
