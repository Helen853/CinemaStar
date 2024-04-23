// NetworkRequest.swift
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
                let result = try JSONDecoder().decode(FilmsDTO.self, from: data)
                let res = result.docs.map { Films(dto: $0) }
                print([result])
                completion(.success(res))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }

//    func getImage(request: URLRequest, completion: @escaping(UIImage?) -> Void) {
//
//    }
}
