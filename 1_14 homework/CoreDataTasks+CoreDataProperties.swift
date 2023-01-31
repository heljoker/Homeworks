//
//  CoreDataTasks+CoreDataProperties.swift
//  1_14 homework
//
//  Created by Павел Замулин on 22.07.2022.
//
//

import Foundation
import CoreData


extension CoreDataTasks {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CoreDataTasks> {
        return NSFetchRequest<CoreDataTasks>(entityName: "CoreDataTasks")
    }

    @NSManaged public var taskname: String?

}

extension CoreDataTasks : Identifiable {

}
