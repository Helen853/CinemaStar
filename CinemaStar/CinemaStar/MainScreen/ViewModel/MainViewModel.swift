// MainViewModel.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

protocol MainViewModelProtocol {
    var filmsLoaded: (([Films]) -> Void)? { get set }
    func callService()
}

final class MainViewModel: MainViewModelProtocol {
    var filmsLoaded: (([Films]) -> Void)?
    var films: [Films]?
    var networkService: NetworkServiceProtocol?
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }

    func callService() {
        networkService?.getFilms { [weak self] response in
            switch response {
            case let .success(films):
                self?.films = films
                self?.filmsLoaded?(films)
            case let .failure(error):
                print("\(error.localizedDescription)")
            }
        }
    }
}
