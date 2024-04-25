// APIResource.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Протокол для апи ресурса
protocol APIResource {
    /// Тип данных
    associatedtype ModelType: Decodable
    /// Путь для запроса
    var methodPath: String { get }
    /// Параметры запроса
    var queryItems: URLQueryItem? { get }
}

// MARK: - Extension APIResource

extension APIResource {
    // свойство с конфигурацией ЮРЛзапроса
    var url: URL? {
        // URL-адрес API
        var components = URLComponents(string: "https://api.kinopoisk.dev/v1.4/movie") ?? URLComponents()
        components.path += methodPath
        if let queryItems {
            components.queryItems = [queryItems]
        }
        return components.url
    }
}
