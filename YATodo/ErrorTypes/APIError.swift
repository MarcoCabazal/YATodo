//
//  APIError.swift
//  YATodo
//
//  Created by Marco Cabazal on 2/14/18.
//  Copyright © 2018 The Chill Mill, Inc. All rights reserved.
//

import Alamofire
import SwiftyJSON

enum APIErrorCode: String {
  case invalidLogin = "UserError::InvalidLogin"
  case unknown      = "UserError::Unknown"
}

enum APIError: DisplayableError {
  case connectivityError
  case unknown

  var title: String {
    return "API Error"
  }

  var message: String {
    switch self {
    case .connectivityError:
      return "Couldn't connect to the server"
    case .unknown:
      return "Something went wrong."
    }
  }

  init(code: String) {
    switch code {
    default:
      self = .unknown
    }
  }

  /*
  init(response: DataResponse<[Any]>) {
    guard let error = response.result.error as NSError?, error.code != -1009 else {
      self = .connectivityError
      return
    }

    guard let data = response.data else {
      self = .unknown
      return
    }

    if let code = JSON(data)["code"].string,
      let status = JSON(data)["status"].string,
      let errorDesc = JSON(data)["error"].string {
      self = APIError(code: code)
    } else {
      self = .unknown
    }
  }
 */
}

