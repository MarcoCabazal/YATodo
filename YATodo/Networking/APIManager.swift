//
//  APIManager.swift
//  YATodo
//
//  Created by Marco Cabazal on 2/4/18.
//  Copyright © 2018 The Chill Mill, Inc. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper
import ObjectMapper
import SwiftyJSON

struct APIManager {
  static let shared = APIManager()

  typealias GenericResponse<T> = (T?, Error?, JSON?) -> Void
  typealias GenericArrayResponse<T> = ([T]?, Error?, JSON?) -> Void

  func getCollection<T: Mappable>(of: T.Type,
                                  router: URLRequestConvertible,
                                  keyPath: String,
                                  completion: @escaping GenericArrayResponse<T>) {

    Alamofire.request(router)
      .validate()
      .responseArray(keyPath: keyPath) { (response: DataResponse<[T]>) in

        var json: JSON?

        if let data = response.data {
          do { json = try JSON(data: data) }
          catch { }
        }

        switch response.result {
        case .success:
          if let resultsArray = response.result.value as [T]! {
            completion(resultsArray, nil, json)
          }
        case .failure(let error):
          print("API Error \(router.urlRequest.debugDescription): \(error.localizedDescription)")
          completion(nil, error, json)
        }
      }
  }

  func request<T: Mappable>(object: T.Type,
                            router: URLRequestConvertible,
                            keyPath: String,
                            completion: @escaping GenericResponse<T>) {

    Alamofire.request(router)
      .validate()
      .responseObject(keyPath: keyPath) { (response: DataResponse<T>) in

        var json: JSON?

        if let data = response.data {
          do { json = try JSON(data: data) }
          catch { }
        }

        switch response.result {
        case .success:
          if let result = response.result.value {
            completion(result, nil, json)
          }
        case .failure(let error):

          print("API Error \(router.urlRequest.debugDescription): \(error.localizedDescription)")
          completion(nil, error, json)
        }
    }
  }
}
