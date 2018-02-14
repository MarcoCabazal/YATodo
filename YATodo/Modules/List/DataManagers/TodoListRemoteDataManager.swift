//
//  TodoListRemoteDataManager.swift
//  Yet Another Todo App (using Viper)
//
//  Created by Marco Cabazal on 18 Jan 2017.
//  Copyright © 2017 The Chill Mill, Inc. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper
import Hydra

// MARK: CALLED BY INTERACTOR
class TodoListRemoteDataManager: TodoListRemoteDataManagerProtocol {

  func retrieveDataFromAPI() -> Promise<[TodoModel]> {
    return Promise<[TodoModel]>(in: .background) { resolve, reject, _ in
      Alamofire.request(APIRouter.todos)
        .validate()
        .responseArray(keyPath: "todos") { (response: DataResponse<[TodoModel]>) in

          switch response.result {
          case .success(let data):
            resolve(data)
          case .failure:
            reject(APIError.unknown)
          }
      }
    }
  }
}
