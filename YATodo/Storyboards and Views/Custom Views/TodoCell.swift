//
//  TodoTableViewCell.swift
//  Yet Another Todo App (using Viper)
//
//  Created by Marco Cabazal on 2/3/18.
//  Copyright © 2017 The Chill Mill, Inc. All rights reserved.
//

import UIKit

class TodoCell: UITableViewCell {
  
  @IBOutlet weak var titleLabel: UILabel!
  
  func configure(with object: TodoModel) {
    titleLabel?.text = object.title
  }
}
