//
//  FilmsViewModel.swift
//  Yassir Case Study
//
//  Created by Abdelrahman Elnagdy on 23/06/2022.
//

import Foundation
class FilmsViewModel {
    let dataProvider: FilmsDataProviderProtocol?
    var films: [FilmsUIModel]?
    var modelMapper: UIModelMapper?

    /// An instance of ContentState enum to determine the loading status
    public var contentState: ContentState = .empty {
        didSet {
            self.updateLoadingStatus?()
        }
    }

    ///  This closure is used to update loading status from a state to another
    public var updateLoadingStatus: (() -> Void)?

    required public init() {
        self.dataProvider = FilmsDataProvider()
        modelMapper = UIModelMapper()
    }

    /// When this function is called the films data is fetched and the UIModel is mapped and filled
    ///   - Parameters:
    ///     - pageNumber: an Integer that represents the page number
    func fetchAllFilms(pageNumber: Int) {
        contentState = .loading
        dataProvider?.fetchAllFilms(pageNumber: pageNumber) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let films):
                let filmsUIModel = self.modelMapper?.createFilmsUIModel(filmsModel: films)
                self.films = filmsUIModel
                self.contentState = .populated

            case .failure(let error):
                self.contentState = .error
                AppCommon.shared.showSwiftMessage(title: "Error", message: error.message , theme: .error)
            }
        }
    }

    /// this function returns the count of the list of films
    func getFilmsCount() -> Int {
        return films?.count ?? 0
    }
}
