//
//  Endpoints.swift
//  Yet Another Todo App (using Viper)
//
//  Created by Marco Cabazal on 18 Jan 2017.
//  Copyright © 2017 The Chill Mill, Inc. All rights reserved.
//

import Alamofire

struct Config {
//  static let API = "http://yatodo.rb/v1"
  static let API = "https://yatodo-api.herokuapp.com/v1"
}

enum APIRouter: URLRequestConvertible {
  case todos
  case createTodo(title: String, category: Int)
  case deleteTodo(id: Int)

  private var path: String {
    switch self {
    case .todos:
      return "/todos"
    case .createTodo:
      return "/todos"
    case .deleteTodo(let id):
      return "/todos/\(id)"
    }
  }

  private var method: HTTPMethod {
    switch self {
    case .todos:
      return .get
    case .createTodo:
      return .post
    case .deleteTodo:
      return .delete
    }
  }

  private var parameters: Parameters? {
    return nil
  }

  private var headers: [String: String] {
    return [ "Content-Type": "application/json" ]
  }

  func asURLRequest() throws -> URLRequest {
    let baseURL = try Config.API.asURL()
    var urlRequest = URLRequest(url: baseURL.appendingPathComponent(path))

    urlRequest.httpMethod = method.rawValue

    for (header, value) in headers {
      urlRequest.setValue(value, forHTTPHeaderField: header)
    }

    urlRequest = try JSONEncoding.default.encode(urlRequest, with: parameters)

    return urlRequest
  }
}
