// ImageRequest.swift
// Copyright © RoadMap. All rights reserved.

import Foundation
import UIKit

/// kil
class ImageRequest {
    let url: URL

    init(url: URL) {
        self.url = url
    }
}

extension ImageRequest: NetworkRequest {
    func execute(withCompletion completion: @escaping (Result<[Films], Error>) -> Void) {
        getFilms(request: URLRequest(url: url), completion: completion)
    }

    typealias ModelType = UIImage

    func decode(_ data: Data) -> UIImage? {
        UIImage(data: data)
    }
}
