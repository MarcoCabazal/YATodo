//
//  TodoListWireFrame.swift
//  Yet Another Todo App (using Viper)
//
//  Created by Marco Cabazal on 18 Jan 2017.
//  Copyright © 2017 The Chill Mill, Inc. All rights reserved.
//

import UIKit

final class TodoListWireFrame {

  static func prepareModule() -> UIViewController {
    let navController = UINavigationController.instantiate(from: .main, identifier: "mainNavigationController")

    guard let view = navController.childViewControllers.first as? TodoListView else {
      return UIViewController()
    }

    let presenter: TodoListPresenterProtocol & TodoListInteractorOutputProtocol = TodoListPresenter()
    let interactor: TodoListInteractorProtocol = TodoListInteractor()
    let wireFrame: TodoListWireFrameProtocol = TodoListWireFrame()
    let localDataManager: TodoListLocalDataManagerProtocol = TodoListLocalDataManager()
    let remoteDataManager: TodoListRemoteDataManagerProtocol = TodoListRemoteDataManager()

    // INTEGRATION
    view.presenter = presenter
    presenter.view = view
    presenter.wireFrame = wireFrame
    presenter.interactor = interactor
    interactor.presenter = presenter
    interactor.localDataManager = localDataManager
    interactor.remoteDataManager = remoteDataManager

    return navController
  }
}

// MARK: NAVIGATION
extension TodoListWireFrame: TodoListWireFrameProtocol {

  func navigate(to object: TodoModel, from view: TodoListViewProtocol) {
    guard let sourceView = view as? UIViewController else { return }

    let detailVC = TodoDetailWireFrame.prepareModule(with: object)
    sourceView.navigationController?.pushViewController(detailVC, animated: true)
  }
}
