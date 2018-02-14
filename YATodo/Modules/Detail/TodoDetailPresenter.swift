//
//  TodoDetailPresenter.swift
//  Yet Another Todo App (using Viper)
//
//  Created by Marco Cabazal on 18 Jan 2017.
//  Copyright © 2017 The Chill Mill, Inc. All rights reserved.
//

final class TodoDetailPresenter {
  
  weak var view: TodoDetailViewProtocol?
  var wireFrame: TodoDetailWireFrameProtocol?
  var dataSource: TodoModel?
}

// MARK: CALLED BY VIEW
extension TodoDetailPresenter: TodoDetailPresenterProtocol {

  func viewDidLoad() {
    view?.render(content: dataSource)
  }
}
