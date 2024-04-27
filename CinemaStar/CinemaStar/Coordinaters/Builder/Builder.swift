// Builder.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Билдер для создание экранов
final class Builder {
    /// Создание главного экрана
    func makeMainViewController(coordinator: CinemaCoordinator) -> MainViewController {
        let mainViewModel = MainViewModel(coordinator: coordinator)
        let mainViewController = MainViewController()
        mainViewController.mainViewModel = mainViewModel
        return mainViewController
    }

    /// Создание детального экрана
    /// - Parameters:
    ///  -id: Идентификтор ресурса
    func makeDetailViewController(id: Int) -> FilmDetailsViewController {
        let detailsViewController = FilmDetailsViewController()
        let cinemaCoordinator = CinemaCoordinator()
        let detailViewModel = DetailsViewModel(coordinator: cinemaCoordinator, idFilm: id)
        detailsViewController.detailsViewModel = detailViewModel
        return detailsViewController
    }
}
