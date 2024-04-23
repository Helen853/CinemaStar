// NetworkService.swift
// Copyright © RoadMap. All rights reserved.

import Foundation
import UIKit

/// Протокол NetworkServiceProtocol
protocol NetworkServiceProtocol {
    // Получение детального фильма
//    func getFilmDetail(_ url: String, completion: @escaping (Result<Films, Error>) -> Void)
    /// Получение фильма
    func getFilms(completion: @escaping (Result<[Films], Error>) -> Void)
}

/// Сервис для получения данных
final class NetworkService: NetworkServiceProtocol {
    func getFilms(completion: @escaping (Result<[Films], Error>) -> Void) {
        var components = URLComponents(string: "https://api.kinopoisk.dev/v1.4/movie/search")
        components?.queryItems = [URLQueryItem(name: "query", value: "история")]
        guard let req = components?.url else { return }
        var request = URLRequest(url: req)
        request.setValue("W1DJ0J7-2KV4JBC-HRQH66X-JTVVYXG", forHTTPHeaderField: "X-API-KEY")

        URLSession.shared.dataTask(with: request) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else { return }
            do {
                let result = try JSONDecoder().decode(FilmsDTO.self, from: data)
                let res = result.docs.map { Films(dto: $0) }
                completion(.success(res))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
