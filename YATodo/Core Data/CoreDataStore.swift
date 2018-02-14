//
//  CoreDataStore.swift
//  Yet Another Todo App (using Viper)
//
//  Created by Marco Cabazal on 18 Jan 2017.
//  Copyright © 2017 The Chill Mill, Inc. All rights reserved.
//

import CoreData
import UIKit

struct CoreDataStore {

  static var persistentStoreCoordinator: NSPersistentStoreCoordinator? {
    if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
      return appDelegate.persistentContainer.persistentStoreCoordinator
    }
    return nil
  }

  static var managedObjectModel: NSManagedObjectModel? {
    if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
      return appDelegate.persistentContainer.managedObjectModel
    }
    return nil
  }

  static var moc: NSManagedObjectContext? {
    if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
      return appDelegate.persistentContainer.viewContext
    }
    return nil
  }
}
