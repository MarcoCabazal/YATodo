//
//  TodoDetailWireFrame.swift
//  Yet Another Todo App (using Viper)
//
//  Created by Marco Cabazal on 18 Jan 2017.
//  Copyright © 2017 The Chill Mill, Inc. All rights reserved.
//

import UIKit

final class TodoDetailWireFrame: TodoDetailWireFrameProtocol {

  static func prepareModule(with object: TodoModel) -> UIViewController {
    let view = TodoDetailView.instantiate(from: .main)

    let presenter: TodoDetailPresenterProtocol = TodoDetailPresenter()
    let wireFrame = TodoDetailWireFrame()

    view.presenter = presenter
    presenter.view = view
    presenter.dataSource = object
    presenter.wireFrame = wireFrame

    return view
  }
}
