//
//  NetworkError.swift
//  Yassir Case Study
//
//  Created by Abdelrahman Elnagdy on 23/06/2022.
//

import Foundation
public enum NetworkError: Error {
    var message: String {
        switch self {
        case .networkError(let networkMessage):
            return networkMessage
        default:
            return "Something went wrong"
        }
    }
    
    case networkError(message: String)
    case other
}
