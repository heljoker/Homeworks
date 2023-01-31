//
//  PersistanceCoreData.swift
//  1_14 homework
//
//  Created by Павел Замулин on 09.04.2022.
//

import Foundation
import CoreData
import UIKit

class PersistanceCoreData {
    
    static let shared = PersistanceCoreData()
    
    let context: NSManagedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    func saveInData(data: [String]) {
        let entityDescription = NSEntityDescription.entity(forEntityName: "CoreDataTasks", in: context)
        do {
            let tasks = try context.fetch(CoreDataTasks.fetchRequest())
            for task in tasks {
                context.delete(task as NSManagedObject)
            }
            for text in data {
                let newTask = CoreDataTasks(entity: entityDescription!, insertInto: context)
                newTask.taskname = text
            }
        } catch {
            print("Error in saving")
        }
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
    }
    
    func loadFromData(data: inout [String]) {
        do {
            let tasks = try context.fetch(CoreDataTasks.fetchRequest())
            for task in tasks {
                guard let text = task.taskname else { break }
                data.append(text)
            }
        } catch {
            print("Error in loading")
        }
    }
}
