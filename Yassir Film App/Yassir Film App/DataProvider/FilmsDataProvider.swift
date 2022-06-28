//
//  FilmsDataProvider.swift
//  Yassir Case Study
//
//  Created by Abdelrahman Elnagdy on 23/06/2022.
//

import Foundation
/// This class conforms for *FilmsDataProviderProtocol* and implements its stubs
class FilmsDataProvider: FilmsDataProviderProtocol {
    func fetchAllFilms(pageNumber: Int, completion: @escaping (Result<FilmsModel, NetworkError>) -> Void) {
        NetworkClient.performRequest(
            route: APIRouter.allFilms(page: pageNumber),
            completion: completion
        )
    }
}
