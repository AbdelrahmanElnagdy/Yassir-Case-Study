//
//  UIModelMapper.swift
//  Yassir Case Study
//
//  Created by Abdelrahman Elnagdy on 23/06/2022.
//

import Foundation
/// This class is in charge of mapping the response model into UIModel which only carries the data that will be displayed.
class UIModelMapper {
    /// This function is in charge of converting the films response model and returns a list of *FilmsUIModel* which is the corresponding UIModel
    ///   - Parameters:
    ///     - filmsModel: an instance of *FilmsModel* that represents the response model
    func createFilmsUIModel(filmsModel: FilmsModel?) -> [FilmsUIModel] {
        var uiModels: [FilmsUIModel] = []
        guard let films = filmsModel else {
            return []
        }
        for film in films.results ?? [] {
            let filmUIModel = FilmsUIModel(
                name: film.title,
                id: film.id,
                releaseDate: film.releaseDate,
                image: Constants.URLs.imagesBaseUrl + (film.posterPath ?? "") ,
                rating: film.voteAverage,
                overview: film.overview
            )
            uiModels.append(filmUIModel)
        }
        return uiModels
    }
}
