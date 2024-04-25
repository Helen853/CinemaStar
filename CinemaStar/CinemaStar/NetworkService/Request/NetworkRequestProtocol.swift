// NetworkRequestProtocol.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

protocol NetworkRequest: AnyObject {
    associatedtype ModelType
    func decode(_ data: Data) -> ModelType?
    func execute(withCompletion completion: @escaping (ModelType?) -> Void)
}

extension NetworkRequest {
    func getFilms(url: URL, completion: @escaping (ModelType?) -> Void) {
        var request = URLRequest(url: url)
        request.setValue("ETKDY4P-Q024W58-Q4RRSYJ-Y72CWZR", forHTTPHeaderField: "X-API-KEY")
        URLSession.shared.dataTask(with: request) { [self] data, _, _ in
            guard let data = data else { return }
            DispatchQueue.global().async {
                let result = self.decode(data)
                DispatchQueue.main.async { completion(result) }
            }
        }.resume()
    }
}
