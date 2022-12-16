//
//  ToDoMessage+CoreDataProperties.swift
//  ToDoListApp
//
//  Created by Erkan Emir on 13.12.22.
//
//

import Foundation
import CoreData


extension ToDoMessage {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ToDoMessage> {
        return NSFetchRequest<ToDoMessage>(entityName: "ToDoMessage")
    }

    @NSManaged public var message: String?

}

extension ToDoMessage : Identifiable {

}
