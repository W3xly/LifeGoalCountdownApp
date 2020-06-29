//
//  CoreDataManager.swift
//  LifeGoalCountdownApp
//
//  Created by Johana Šlechtová on 29/06/2020.
//  Copyright © 2020 Jan Podmolík. All rights reserved.
//

import CoreData
import UIKit

final class CoreDataManager {
    
    lazy var persistentContainer: NSPersistentContainer = {
        let persistentContainer = NSPersistentContainer(name: "LifeGoalCountdownApp")
        persistentContainer.loadPersistentStores { _, error in
            print("DEBUG: \(error?.localizedDescription ?? "")")
        }
        return persistentContainer
    }()
    
    var manageObjectContext: NSManagedObjectContext {
        persistentContainer.viewContext
    }
    
    func saveGoal(name: String, date: Date, image: UIImage) {
        let goal = Goal(context: manageObjectContext)
        let imageData = image.jpegData(compressionQuality: 0.3) // Original is image binaryDataType
        
        goal.setValue(name, forKey: "name")
        goal.setValue(date, forKey: "date")
        goal.setValue(imageData, forKey: "image")
        
        do {
            try manageObjectContext.save()
        } catch {
            print("DEBUG: \(error.localizedDescription)")
        }
    }
    
    func fetchGoals() -> [Goal] {
        do {
            let fetchRequest = NSFetchRequest<Goal>(entityName: "Goal")
            let goals = try manageObjectContext.fetch(fetchRequest)
            return goals
        } catch {
            print("DEBUG: \(error.localizedDescription)")
            return []
        }
    }
}
