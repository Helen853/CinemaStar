// NetworkRequestProtocol.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Протокол для сетевого запроса
protocol NetworkRequest: AnyObject {
    /// Модель для типа объекта
    associatedtype ModelType
    /// Декодирование данных
    /// - Parameters:
    /// - data: Данные
    /// - Returns:
    /// - Модель определенного типа
    func decode(_ data: Data) -> ModelType?
    /// Выполнение запроса
    func execute(withCompletion completion: @escaping (ModelType?) -> Void)
}

// MARK: - Extension NetworkRequest

extension NetworkRequest {
    /// Загрузка фильма
    /// - Parameters:
    /// - url: Юрл-адрес запроса
    func getFilms(url: URL, completion: @escaping (ModelType?) -> Void) {
        let token = TokenService.shared.returnToken()
        var request = URLRequest(url: url)
        request.setValue(token, forHTTPHeaderField: AppConstants.headerName)
        URLSession.shared.dataTask(with: request) { [self] data, _, _ in
            guard let data = data else { return }
            DispatchQueue.global().async {
                let result = self.decode(data)
                DispatchQueue.main.async { completion(result) }
            }
        }.resume()
    }
}
