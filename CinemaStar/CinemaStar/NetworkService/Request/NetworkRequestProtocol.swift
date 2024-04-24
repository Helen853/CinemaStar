// NetworkRequestProtocol.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

protocol NetworkRequest: AnyObject {
    associatedtype ModelType
    func decode(_ data: Data) -> ModelType?
    func execute(withCompletion completion: @escaping (Result<[Films], Error>) -> Void)
}

extension NetworkRequest {
    func getFilms(request: URLRequest, completion: @escaping (Result<[Films], Error>) -> Void) {
        URLSession.shared.dataTask(with: request) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else { return }
            do {
                guard let result = self.decode(data) as? [Films] else { return }
                print([result])
                completion(.success(result))
            }
        }.resume()
    }

//    func getImage(name:, completion: @escaping(UIImage?) -> Void) {
//
//    }

    func loadImage(url: URLRequest, complition: @escaping (Data?, URLResponse?, Error?) -> ()) {
        let config = URLSessionConfiguration.default
        config.requestCachePolicy = .reloadIgnoringLocalCacheData
        config.urlCache = nil

        let sessin = URLSession(configuration: config)
        sessin.dataTask(with: url, completionHandler: complition).resume()
    }
}
