//
//  FilmsDataProviderProtocol.swift
//  Yassir Case Study
//
//  Created by Abdelrahman Elnagdy on 23/06/2022.
//

import Foundation
/// This protocol is in charge of fetching the Films Data
public protocol FilmsDataProviderProtocol: AnyObject {
    /// This function fetches the data of the fiims and returns an instance of *FilmsModel* in case of success, and an instance of *NetworkError* in case of failure
    ///   - Parameters:
    ///     - completion:  a closure that returns an instance of *FilmsModel* in case of success or an instance of  *NetworkError* in case of failure
    ///     - pageNumber: An Integer that represents the number of page
    func fetchAllFilms(pageNumber: Int, completion:@escaping (Result<FilmsModel, NetworkError>) -> Void)
}
