//
//  NetworkClient.swift
//  Yassir Case Study
//
//  Created by Abdelrahman Elnagdy on 23/06/2022.
//

import Foundation
import Alamofire

/// This class represents the network client which performs the network request
public class NetworkClient {
    /// This function is in charge of performing the network request
    ///   - Parameters:
    ///     - route: an instance of *APIRouter*
    ///     - decoder: the JSON decoder
    ///     - completion: A closure that returns Model in case of success and an instance *NetworkError* in case of failure
    static func performRequest<T: Decodable>(route: APIRouter, decoder: JSONDecoder = JSONDecoder(), completion: @escaping (Result<T, NetworkError>) -> Void) {
         AF.request(route).validate(statusCode: 200 ..< 300)
             .responseDecodable { (response: AFDataResponse<T>) in
                 switch response.result {
                 case .success(let model):
                     completion(.success(model))
                     break
                 case .failure(let error):
                     debugPrint(error)
                     print(error.localizedDescription)
                     print("\(error)")
                     do {
                         guard let data = response.data else {
                             completion(.failure(.other))
                             return
                         }
                         let json = try JSONSerialization.jsonObject(with: data, options: [])
                         if let message = (json as? [String: Any])?["Message"] as? String {
                             completion(.failure(.networkError(message: message)))
                         } else {
                             completion(.failure(.networkError(message: error.localizedDescription)))
                         }
                     } catch {
                         completion(.failure(.networkError(message: error.localizedDescription)))
                     }
                     break
                 }
         }
     }
}
