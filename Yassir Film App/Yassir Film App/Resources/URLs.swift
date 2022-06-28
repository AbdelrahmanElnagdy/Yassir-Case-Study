//
//  URLs.swift
//  Yassir Case Study
//
//  Created by Abdelrahman Elnagdy on 23/06/2022.
//

import Foundation

struct Constants {
    struct URLs {
        static let movieList = "https://api.themoviedb.org/3/discover/movie"
        static let imagesBaseUrl = "https://image.tmdb.org/t/p/w500"
    }
    struct APIParameterKey {
        static let authMethod = "api_key"
        static let apiKey = "c9856d0cb57c3f14bf75bdc6c063b8f3"
        static let id = "movie_id"
        static let page = "page"
    }
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
    case json = "application/json"
}
