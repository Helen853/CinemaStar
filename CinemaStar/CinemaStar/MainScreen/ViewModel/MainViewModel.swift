// MainViewModel.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

protocol MainViewModelProtocol {
    var filmsLoaded: (([Films]?) -> Void)? { get set }
    var coordinator: CinemaCoordinator? { get set }
    func callService()
    func showDetail(id: Int)
}

final class MainViewModel {
    var filmsLoaded: (([Films]?) -> Void)?
    var films: [Films] = []
    var coordinator: CinemaCoordinator?

    init(coordinator: CinemaCoordinator) {
        self.coordinator = coordinator
    }
}

extension MainViewModel: MainViewModelProtocol {
    func showDetail(id: Int) {
        coordinator?.showDetailFilm(id: id)
    }

    func callService() {
        let resource = FilmsResource(
            queryItems: URLQueryItem(name: "query", value: "история")
        )
        let request = APIRequest(resource: resource)
        request.execute { [weak self] response in
            guard let response else { return }
            for film in response.docs {
                self?.films.append(Films(dto: film))
            }
            self?.filmsLoaded?(self?.films)
        }
    }
}
