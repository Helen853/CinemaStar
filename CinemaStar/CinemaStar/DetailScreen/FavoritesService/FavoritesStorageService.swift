// FavoritesStorageService.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Сервис сохранения и удаления из избранного
final class FavoritesStorageService {
    // MARK: - Constsnts

    private enum Constants {
        static let favoritesKey = "favorites"
    }

    static let shared = FavoritesStorageService()

    // MARK: - Public Properties

    var favorites: [FilmDetail] = []

    // MARK: - Public Methods

    func loadFavorites() -> [FilmDetail]? {
        guard let saved = UserDefaults.standard.data(forKey: Constants.favoritesKey) else { return [] }
        do {
            return try JSONDecoder().decode([FilmDetail].self, from: saved)
        } catch {
            print(error)
            return []
        }
    }

    func addFavorites(_ films: FilmDetail) {
        favorites.append(films)
        saveFavorites()
    }

    func removeFavorites(_ index: Int) {
        favorites.remove(at: index)
        saveFavorites()
    }

    func load() -> [FilmDetail] {
        guard let loadFavorites = loadFavorites() else { return [FilmDetail(dto: MovieDTO(
            id: 0,
            poster: Poster(url: ""),
            name: "",
            rating: Rating(kp: 0.0),
            description: "",
            year: 0,
            countries: [Country](),
            type: MovieType.movie,
            persons: [Person](),
            spokenLanguages: [""],
            similarMovies: [SimilarMovie]()
        ))]
        }
        favorites = loadFavorites
        return favorites
    }

    // MARK: - Private Methods

    private func saveFavorites() {
        do {
            let encodedData = try JSONEncoder().encode(favorites)
            UserDefaults.standard.set(encodedData, forKey: Constants.favoritesKey)
        } catch {
            print(error)
        }
    }
}
