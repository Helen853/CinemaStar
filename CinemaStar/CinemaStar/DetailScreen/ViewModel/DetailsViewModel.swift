// DetailsViewModel.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

protocol DetailsViewModelProtocol {
    var filmsLoaded: ((FilmsDetail?) -> Void)? { get set }
    var coordinator: CinemaCoordinator? { get set }
    func callService()
}

final class DetailsViewModel {
    var filmsLoaded: ((FilmsDetail?) -> Void)?
    var filmsDetail: FilmsDetail?
    var coordinator: CinemaCoordinator?
    var idFilm: Int

    init(coordinator: CinemaCoordinator, idFilm: Int) {
        self.coordinator = coordinator
        self.idFilm = idFilm
    }
}

extension DetailsViewModel: DetailsViewModelProtocol {
    func callService() {
        var resource = FilmsDetailResource(id: idFilm)
        let request = APIRequest(resource: resource)

        request.execute { [weak self] movieDTO in
            guard let dto = movieDTO else { return }
            let film = FilmsDetail(dto: dto)
            self?.filmsDetail = film
            self?.filmsLoaded?(self?.filmsDetail)
        }
    }
}
