// DetailsViewModel.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Протокол для ViewModel детального экрана
protocol DetailsViewModelProtocol {
    /// Передача загруженных данных
    var filmsLoaded: ((FilmsDetail?) -> Void)? { get set }
    /// Метод для загрузки данных
    func callService()
}

/// ViewModel детального экрана
final class DetailsViewModel {
    var filmsLoaded: ((FilmsDetail?) -> Void)?

    // MARK: - Private Properties

    private var filmsDetail: FilmsDetail?
    private var coordinator: CinemaCoordinator?
    private var idFilm: Int

    // MARK: - Initializers

    init(coordinator: CinemaCoordinator, idFilm: Int) {
        self.coordinator = coordinator
        self.idFilm = idFilm
    }
}

// MARK: - Extension

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
