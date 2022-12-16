//
//  CoreDataHelper.swift
//  ToDoListApp
//
//  Created by Erkan Emir on 15.12.22.
//

import UIKit
import CoreData

class CoreDataHelper {
    
    static let shared = CoreDataHelper()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func fetchData() -> [ToDoMessage]? {
        do {
            return try context.fetch(ToDoMessage.fetchRequest())
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }
    
    func saveData(message: String) {
        let toDoMessage = ToDoMessage(context: context)
        toDoMessage.message = message
        
        do {
            try self.context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func deleteData(index: Int) {
        if let dataArray = fetchData() {
            context.delete(dataArray[index])
            
            do {
                try self.context.save()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func changeData(index: Int, message: String) {

        if let dataArray = fetchData() {
            let fetchMessage: NSFetchRequest<ToDoMessage> = ToDoMessage.fetchRequest()
            fetchMessage.predicate = NSPredicate(format: "message = %@", dataArray[index].message ?? "")
            let results = try? context.fetch(fetchMessage)

            do {
                if results?.count == 1, let results = results {
                    let objectUpdate = results[0]
                    objectUpdate.setValue(message, forKey: "message")
                    try self.context.save()
                }
              } catch {
                print(error)
              }
        }
    }
}
