// ImageRequest.swift
// Copyright © RoadMap. All rights reserved.

import Foundation
import UIKit

///  ImageRequest
class ImageRequest {
    let url: URL

    init(url: URL) {
        self.url = url
    }
}

extension ImageRequest: NetworkRequest {
    func execute(withCompletion completion: @escaping (UIImage?) -> Void) {
        getFilms(url: url, completion: completion)
    }

    typealias ModelType = UIImage

    func decode(_ data: Data) -> UIImage? {
        UIImage(data: data)
    }
}
