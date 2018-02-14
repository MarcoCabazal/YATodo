//
//  TodoDetailProtocols.swift
//  Yet Another Todo App (using Viper)
//
//  Created by Marco Cabazal on 18 Jan 2017.
//  Copyright © 2017 The Chill Mill, Inc. All rights reserved.
//

import UIKit
import Hydra

// MARK: Called by VIEW -> Implemented BY PRESENTER
protocol TodoListPresenterProtocol: class {
  var view: TodoListViewProtocol? { get set }
  var wireFrame: TodoListWireFrameProtocol? { get set }
  var interactor: TodoListInteractorProtocol? { get set }

  func viewDidLoad()

  // datasource
  var numberOfSection: Int { get }
  func numberOfRows(in section: Int) -> Int
  func content(at row: Int) -> TodoModel?

  func process(object: TodoModel)
}

// MARK: PRESENTER -> INTERACTOR
protocol TodoListInteractorProtocol: class {
  var presenter: TodoListInteractorOutputProtocol? { get set }
  var localDataManager: TodoListLocalDataManagerProtocol? { get set }
  var remoteDataManager: TodoListRemoteDataManagerProtocol? { get set }

  func retrieveData()
}

// MARK: INTERACTOR -> REMOTEDATAMANAGER
protocol TodoListRemoteDataManagerProtocol: class {
  func retrieveDataFromAPI() -> Promise<[TodoModel]>
}

// MARK: INTERACTOR -> LOCALDATAMANAGER
protocol TodoListLocalDataManagerProtocol: class {
  func retrieveDataFromStorage() -> Promise<[Todo]>
  func saveEntity(id: Int, title: String, dueDate: Date?) -> Promise<Void>
}

// MARK: INTERACTOR -> PRESENTER
protocol TodoListInteractorOutputProtocol: class {
  func present(data: [TodoModel])
  func present(error: Error)
}

// MARK: PRESENTER -> VIEW
protocol TodoListViewProtocol: Loadable {
  func render()
}

// MARK: PRESENTER -> WIREFRAME
protocol TodoListWireFrameProtocol: class {
  static func prepareModule() -> UIViewController
  func navigate(to object: TodoModel, from view: TodoListViewProtocol)
}
