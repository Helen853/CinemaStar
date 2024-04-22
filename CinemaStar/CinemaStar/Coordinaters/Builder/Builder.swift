// Builder.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

final class Builder {
    func makeMainViewController() -> MainViewController {
        let mainViewController = MainViewController()
        return mainViewController
    }

    func makeDetailViewController() -> FilmDetailsViewController {
        let detailsViewController = FilmDetailsViewController()
        return detailsViewController
    }
}
