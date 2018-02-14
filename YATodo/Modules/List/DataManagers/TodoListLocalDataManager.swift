//
//  TodoListLocalDataManager.swift
//  Yet Another Todo App (using Viper)
//
//  Created by Marco Cabazal on 18 Jan 2017.
//  Copyright © 2017 The Chill Mill, Inc. All rights reserved.
//

import CoreData
import Hydra

// MARK: CALLED BY INTERACTOR
class TodoListLocalDataManager: TodoListLocalDataManagerProtocol {
  
  func retrieveDataFromStorage() -> Promise<[Todo]>  {
    return Promise<[Todo]>(in: .main) { resolve, reject, _ in
      guard let moc = CoreDataStore.moc else {
        reject(PersistenceError.mocNotFound)
        return
      }
      do {
        let request: NSFetchRequest<Todo> = NSFetchRequest(entityName: Todo.id)
        // Uncomment this and comment the resolve to simulate an error
//        reject(PersistenceError.objectNotFound)
        resolve(try moc.fetch(request))
      } catch {
        reject(PersistenceError.objectNotFound)
      }
    }
  }
  
  func saveEntity(id: Int, title: String, dueDate: Date?) -> Promise<Void> {
    return Promise<Void>(in: .main) { resolve, reject, _ in
      guard let moc = CoreDataStore.moc else {
        reject(PersistenceError.mocNotFound)
        return
      }

      do {
        if let entity = NSEntityDescription.entity(forEntityName: Todo.id, in: moc) {
          let object = Todo(entity: entity, insertInto: moc)
          object.id = Int32(id)
          object.title = title
          object.dueDate = dueDate
          try moc.save()
          resolve(())
        }
      } catch {
        reject(PersistenceError.couldNotSaveObject)
      }
    }
  }
}
