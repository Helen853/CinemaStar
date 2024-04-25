// DetailsViewModel.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

protocol DetailsViewModelProtocol {
    var filmsLoaded: ((FilmsDetail) -> Void)? { get set }
    var coordinator: CinemaCoordinator? { get set }
    func callService()
}

final class DetailsViewModel {
    var filmsLoaded: ((FilmsDetail) -> Void)?
    var films: FilmsDetail?
    var coordinator: CinemaCoordinator?
    var resource = FilmsResource()
    var idFilm: Int

    init(coordinator: CinemaCoordinator, idFilm: Int) {
        self.coordinator = coordinator
        self.idFilm = idFilm
    }
}

// extension DetailsViewModel: DetailsViewModelProtocol {
//
//    func callService() {
//        resource.id = idFilm
//        let request = APIRequest(resource: resource)
//        request.execute { [weak self] response in
//            guard let response else { return }
//            response.docs.forEach {
//                self?.films?.append(Films(dto: $0))
//            }
//            self?.filmsLoaded?(self?.films)
//    }
//
// }
