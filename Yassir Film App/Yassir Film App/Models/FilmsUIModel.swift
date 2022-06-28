//
//  FilmsUIModel.swift
//  Yassir Case Study
//
//  Created by Abdelrahman Elnagdy on 23/06/2022.
//

import Foundation
public struct FilmsUIModel: Codable {
    /// A string that represents film name
    let name: String?
    /// An Integer that represents film id
    let id: Int?
    /// A string that represents the release date of the film
    let releaseDate: String?
    /// A string that represents the url of the film image
    let image: String?
    /// A double that represents the rating of the film
    let rating: Double?
    /// A sting that represnets that description of the film
    let overview: String?
    

    init(
        name: String?,
        id: Int?,
        releaseDate: String?,
        image: String?,
        rating: Double?,
        overview: String?
    ) {
        self.name = name
        self.id = id
        self.releaseDate = releaseDate
        self.image = image
        self.rating = rating
        self.overview = overview
    }
}
