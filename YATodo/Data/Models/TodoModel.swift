//
//  TodoModel.swift
//  Yet Another Todo App (using Viper)
//
//  Created by Marco Cabazal on 18 Jan 2017.
//  Copyright © 2017 The Chill Mill, Inc. All rights reserved.
//

import Foundation
import ObjectMapper

struct TodoModel {
  var id = 0
  var title = ""
  var dueDate: Date?
}

extension TodoModel: Mappable {

  init?(map: Map) { }

  mutating func mapping(map: Map) {
    id        <- map["id"]
    title     <- map["title"]
    dueDate   <- (map["due_date"], ISODateTransform())
  }
}
