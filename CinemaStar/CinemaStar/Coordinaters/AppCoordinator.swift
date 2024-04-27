// AppCoordinator.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Главный координатор
final class AppCoordinator: BaseCoordinator {
    private var appBuilder = Builder()

    override func start() {
        showCinemaModule()
    }

    private func showCinemaModule() {
        let cinemaCoordinator = CinemaCoordinator()
        let cinemaModule = appBuilder.makeMainViewController(coordinator: cinemaCoordinator)
        cinemaCoordinator.setRootViewController(view: cinemaModule)
        add(coordinator: cinemaCoordinator)
        cinemaCoordinator.start()
    }
}
