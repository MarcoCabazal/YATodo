//
//  TodoDetailProtocols.swift
//  Yet Another Todo App (using Viper)
//
//  Created by Marco Cabazal on 18 Jan 2017.
//  Copyright © 2017 The Chill Mill, Inc. All rights reserved.
//

import UIKit

// MARK: Called by VIEW -> Implemented BY PRESENTER
protocol TodoDetailPresenterProtocol: class {
  weak var view: TodoDetailViewProtocol? { get set }
  weak var wireFrame: TodoDetailWireFrameProtocol? { get set }
  var dataSource: TodoModel? { get set }

  func viewDidLoad()
}

// MARK: PRESENTER -> VIEW
protocol TodoDetailViewProtocol: Loadable {
  func render(content: TodoModel?)
}

// MARK: PRESENTER -> WIREFRAME
protocol TodoDetailWireFrameProtocol: class {
  static func prepareModule(with object: TodoModel) -> UIViewController
}
