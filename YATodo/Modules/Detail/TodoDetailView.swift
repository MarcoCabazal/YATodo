//
//  TodoDetailView.swift
//  Yet Another Todo App (using Viper)
//
//  Created by Marco Cabazal on 18 Jan 2017.
//  Copyright © 2017 The Chill Mill, Inc. All rights reserved.
//

import UIKit

class TodoDetailView: UIViewController {
  
  var presenter: TodoDetailPresenterProtocol?
  
  @IBOutlet weak var titleLabel: UILabel!

  override func viewDidLoad() {
    super.viewDidLoad()
    presenter?.viewDidLoad()
  }
}

// MARK: CALLED BY PRESENTER
extension TodoDetailView: TodoDetailViewProtocol {
  
  func render(content: TodoModel?) {
    guard let content = content else { return }
    titleLabel?.text = content.title
  }
}
