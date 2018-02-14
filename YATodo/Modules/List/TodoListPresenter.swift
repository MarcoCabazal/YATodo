//
//  TodoListPresenter.swift
//  Yet Another Todo App (using Viper)
//
//  Created by Marco Cabazal on 18 Jan 2017.
//  Copyright © 2017 The Chill Mill, Inc. All rights reserved.
//

final class TodoListPresenter {
  
  weak var view: TodoListViewProtocol?
  var wireFrame: TodoListWireFrameProtocol?
  var interactor: TodoListInteractorProtocol?
  var dataSource: [TodoModel] = []
}

// MARK: CALLED BY VIEW
extension TodoListPresenter: TodoListPresenterProtocol {

  func viewDidLoad() {
    view?.showLoadingIndicator()
    interactor?.retrieveData()
  }

  var numberOfSection: Int { return self.dataSource.count + 1  }

  func numberOfRows(in section: Int) -> Int {
    return dataSource.count
  }

  func content(at row: Int) -> TodoModel? {
    return dataSource[row]
  }
  
  func process(object: TodoModel) {
    guard let view = view else { return }
    wireFrame?.navigate(to: object, from: view)
  }
}

// MARK: CALLED BY INTERACTOR
extension TodoListPresenter: TodoListInteractorOutputProtocol {

  func present(data: [TodoModel]) {
    self.dataSource = data
    view?.hideLoadingIndicator()
    view?.render()
  }
  
  func present(error: Error) {
    view?.hideLoadingIndicator()
    view?.show(error: error)
  }
}
