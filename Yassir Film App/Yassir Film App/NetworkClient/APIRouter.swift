//
//  APIRouter.swift
//  Yassir Case Study
//
//  Created by Abdelrahman Elnagdy on 23/06/2022.
//

import Foundation
import Alamofire


enum APIRouter: URLRequestConvertible {
    case allFilms(page: Int?)

    private var method: HTTPMethod {
        return .get
    }
    private var path: String {
        switch self {
        case .allFilms:
            return Constants.URLs.movieList
        }
    }
    private var encoding: ParameterEncoding {
        switch self {
        case .allFilms:
            return URLEncoding(destination: .queryString)
        }
    }
    private var parameters: [String: Any]? {
        switch self {
        case .allFilms(page: let page):
            return [
                Constants.APIParameterKey.authMethod :Constants.APIParameterKey.apiKey,
                Constants.APIParameterKey.page: page ?? 1
            ]
        }
        
    }

    func asURLRequest() throws -> URLRequest {
        let url = try Constants.URLs.movieList.asURL()
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        return try encoding.encode(urlRequest, with: parameters)
    }

}
