//
//  TodoListView.swift
//  Yet Another Todo App (using Viper)
//
//  Created by Marco Cabazal on 18 Jan 2017.
//  Copyright © 2017 The Chill Mill, Inc. All rights reserved.
//

import UIKit

class TodoListView: UIViewController {
  
  var presenter: TodoListPresenterProtocol?
  
  @IBOutlet weak var tableView: UITableView!

  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.tableFooterView = UIView()
    tableView.register(TodoCell.nib, forCellReuseIdentifier: TodoCell.id)
    presenter?.viewDidLoad()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    if let selectedRow = tableView.indexPathForSelectedRow {
      tableView.deselectRow(at: selectedRow, animated: true)
    }
  }
}

// MARK: CALLED BY PRESENTER
extension TodoListView: TodoListViewProtocol {
  
  func render() {
    tableView.reloadData()
  }
}

// MARK: UITABLEVIEW DATASOURCE
extension TodoListView: UITableViewDataSource {

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return presenter?.numberOfRows(in: section) ?? 0
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let content = presenter?.content(at: indexPath.row),
      let cell = tableView.dequeueReusableCell(withIdentifier: TodoCell.id, for: indexPath) as? TodoCell else {
        return tableView.dequeueReusableCell(withIdentifier: TodoCell.id, for: indexPath)
    }

    cell.configure(with: content)
    return cell
  }
}

// MARK: UITABLEVIEW DELEGATE
extension TodoListView: UITableViewDelegate {

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    guard let content = presenter?.content(at: indexPath.row) else { return }
    presenter?.process(object: content)
  }
}
