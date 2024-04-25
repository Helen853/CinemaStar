// Builder.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

final class Builder {
    func makeMainViewController(coordinator: CinemaCoordinator) -> MainViewController {
        let mainViewModel = MainViewModel(coordinator: coordinator)
        let mainViewController = MainViewController()
        mainViewController.mainViewModel = mainViewModel
        return mainViewController
    }

    func makeDetailViewController() -> FilmDetailsViewController {
        let detailsViewController = FilmDetailsViewController()
        let cinemaCoordinator = CinemaCoordinator()
        let detailViewModel = DetailsViewModel(coordinator: cinemaCoordinator, idFilm: 533_055)
        return detailsViewController
    }
}
