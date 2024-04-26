// DetailsViewModel.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Протокол для ViewModel детального экрана
protocol DetailsViewModelProtocol {
    /// Передача загруженных данных
    var filmsLoadedHandler: ((FilmDetail?) -> Void)? { get set }
    /// Передача стейта кнопки
    var favoritesHandler: ((ButtonState) -> Void)? { get set }
    /// Метод для загрузки данных
    func callService()
    /// Переход на главный экран
    func showMainScreen()
    /// Сохранение фильма в избранное
    /// - Parameters:
    /// - films: Детальный фильм
    func saveFavorites(film: FilmDetail)
    /// Возвращает стейт кнопки избранного
    func returnStateButton()
}

/// ViewModel детального экрана
final class DetailsViewModel {
    public var filmsLoadedHandler: ((FilmDetail?) -> Void)?
    public var favoritesHandler: ((ButtonState) -> Void)?

    // MARK: - Private Properties

    private var filmsDetail: FilmDetail?
    private var coordinator: CinemaCoordinator?
    private var idFilm: Int
    private var state: ButtonState = .clear

    // MARK: - Initializers

    init(coordinator: CinemaCoordinator, idFilm: Int) {
        self.coordinator = coordinator
        self.idFilm = idFilm
    }
}

// MARK: - Extension DetailsViewModel + DetailsViewModelProtocol

extension DetailsViewModel: DetailsViewModelProtocol {
    
    // swiftlint:disable all
    func returnStateButton() {
        if (FavoritesStorageService.shared.favorites
            .firstIndex(where: { $0.id == idFilm }) != nil) {
            state = .white
            favoritesHandler?(state)
        } else {
            state = .clear
            favoritesHandler?(state)
        }
    }
    // swiftlint:enable all
    
    func saveFavorites(film: FilmDetail) {
        /// Проверка состояния
        switch state {
        case .clear:
            /// Сохраняем в избранное
           FavoritesStorageService.shared.addFavorites(film)
            /// Меняем стейт
            state = .white
        case .white:
            /// Находим индекс элемента по названию
            guard let indexOfFilm = FavoritesStorageService.shared.favorites
                .firstIndex(where: { $0.name == film.name })
            else { return }
            /// Удаляем элемент из избранного
            FavoritesStorageService.shared.removeFavorites(Int(indexOfFilm))
            /// Меняем стейт
            state = .clear
        }
    }

    func showMainScreen() {
        coordinator?.showCinema()
    }

    func callService() {
        var resource = FilmsDetailResource(id: idFilm)
        let request = APIRequest(resource: resource)

        request.execute { [weak self] movieDTO in
            guard let dto = movieDTO else { return }
            let film = FilmDetail(dto: dto)
            self?.filmsDetail = film
            self?.filmsLoadedHandler?(self?.filmsDetail)
        }
    }
}
