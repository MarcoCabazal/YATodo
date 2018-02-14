//
//  Todo+CoreDataProperties.swift
//  Yet Another Todo App (using Viper)
//
//  Created by Marco Cabazal on 18 Jan 2017.
//  Copyright © 2017 The Chill Mill, Inc. All rights reserved.
//

import Foundation
import CoreData

extension Todo {
  
  @nonobjc public class func fetchRequest() -> NSFetchRequest<Todo> {
    return NSFetchRequest<Todo>(entityName: Todo.id)
  }

  @NSManaged public var id: Int32
  @NSManaged public var title: String?
  @NSManaged public var dueDate: Date?
}
