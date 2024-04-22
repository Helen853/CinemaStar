// CinemaCoordinator.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Координатор экрана с фильмами
final class CinemaCoordinator: BaseCoordinator {
    var rootViewController: UINavigationController?

    override func start() {
        showCinema()
    }

    func showCinema() {
        let mainViewController = Builder().makeMainViewController()
        let rootViewController = UINavigationController(rootViewController: mainViewController)
        setAsRoot​(​_​: rootViewController)
        self.rootViewController = rootViewController
    }
}
