//
//  AppDelegate.swift
//  YATodo
//
//  Created by Marco Cabazal on 1/29/18.
//  Copyright © 2018 The Chill Mill, Inc. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

    let listVC = TodoListWireFrame.prepareModule()

    window = UIWindow(frame: UIScreen.main.bounds)
    window?.rootViewController = listVC
    window?.makeKeyAndVisible()
    return true
  }

  // MARK: CORE DATA STUFF
  lazy var persistentContainer: NSPersistentContainer = {
    let container = NSPersistentContainer(name: "Todo")
    container.loadPersistentStores(completionHandler: { (storeDescription, error) in
      if let error = error as NSError? {
        /*
         Typical reasons for an error here include:
         * The parent directory does not exist, cannot be created, or disallows writing.
         * The persistent store is not accessible, due to permissions or data protection when the device is locked.
         * The device is out of space.
         * The store could not be migrated to the current model version.
         Check the error message to determine what the actual problem was.
         */
        assertionFailure("Unresolved error \(error), \(error.userInfo)")
      }
    })
    return container
  }()

  func saveContext () {
    let context = persistentContainer.viewContext
    if context.hasChanges {
      do {
        try context.save()
      } catch {
        let nserror = error as NSError
        assertionFailure("Unresolved error \(nserror), \(nserror.userInfo)")
      }
    }
  }
}


