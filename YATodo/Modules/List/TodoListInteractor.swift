//
//  TodoListInteractor.swift
//  Yet Another Todo App (using Viper)
//
//  Created by Marco Cabazal on 18 Jan 2017.
//  Copyright © 2017 The Chill Mill, Inc. All rights reserved.
//

final class TodoListInteractor {
  weak var presenter: TodoListInteractorOutputProtocol?
  var localDataManager: TodoListLocalDataManagerProtocol?
  var remoteDataManager: TodoListRemoteDataManagerProtocol?
}

// MARK: CALLED BY PRESENTER
extension TodoListInteractor: TodoListInteractorProtocol {

  func retrieveData() {
    localDataManager?.retrieveDataFromStorage().then({ [weak self] persistedData in
      let data: [TodoModel] = persistedData.map {
        return TodoModel(id: Int($0.id), title: $0.title ?? "", dueDate: $0.dueDate)
      }

      if !data.isEmpty {
        self?.presenter?.present(data: data)
      } else {
        self?.retrieveDataFromAPI()
      }
    }).catch({ [weak self] error in
      self?.presenter?.present(error: error)
    })
  }
}

extension TodoListInteractor {

  fileprivate func retrieveDataFromAPI() {
    remoteDataManager?.retrieveDataFromAPI().then({ [weak self] data in
      self?.persist(data: data)
      self?.presenter?.present(data: data)
    }).catch({ [weak self] error in
      self?.presenter?.present(error: error)
    })
  }

  fileprivate func persist(data: [TodoModel]) {
    for item in data {
      localDataManager?.saveEntity(id: item.id, title: item.title, dueDate: item.dueDate).catch({ [weak self] error in
        self?.presenter?.present(error: error)
      })
    }
  }
}
