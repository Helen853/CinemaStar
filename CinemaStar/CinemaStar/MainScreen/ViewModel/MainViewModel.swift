// MainViewModel.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Протокол ViewModel для главного экрана
protocol MainViewModelProtocol {
    /// Передача загруженных данных
    var filmsLoaded: (([Films]?) -> Void)? { get set }
    /// Загрузка данных
    func callService()
    /// Переход на детальный экран
    func showDetail(id: Int)
}

/// ViewModel главного экрана
final class MainViewModel {
    var filmsLoaded: (([Films]?) -> Void)?

    // MARK: - Private Properties

    private var films: [Films] = []
    private var coordinator: CinemaCoordinator?

    // MARK: - Initializers

    init(coordinator: CinemaCoordinator) {
        self.coordinator = coordinator
    }
}

// MARK: - Extension MainViewModel + MainViewModelProtocol

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
