// FilmDetailsViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран с деталями фильма
final class FilmDetailsViewController: UIViewController {
    // MARK: - Public Properties

    var detailsViewModel: DetailsViewModelProtocol?

    // MARK: - Visual Components

    private let tableView = UITableView()
    private let cellTypes: [DetailType] = [.info, .actor, .recomendation]
    var details: FilmsDetail?
    var filmID: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTable()
        registerCell()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setGradient()
    }

    private func setGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [
            UIColor(red: 179 / 255, green: 141 / 255, blue: 87 / 255, alpha: 0.51).cgColor,
            UIColor(red: 43 / 255, green: 81 / 255, blue: 74 / 255, alpha: 1.0).cgColor
        ]
        view.layer.insertSublayer(gradientLayer, at: 0)
    }

    private func configureTable() {
        view.addSubview(tableView)
        tableView.backgroundColor = .clear
        tableView.rowHeight = UITableView.automaticDimension
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 84).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

    private func registerCell() {
        tableView.register(InfoTableViewCell.self, forCellReuseIdentifier: AppConstants.infoIdentifier)
        tableView.register(ActorTableViewCell.self, forCellReuseIdentifier: AppConstants.actorIdentifier)
        tableView.register(
            RecomendationTableViewCell.self,
            forCellReuseIdentifier: AppConstants.recomendationIdentifier
        )
    }
}

// MARK: - Extension FilmDetailsViewController + UITableViewDataSource

extension FilmDetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cellTypes.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.isScrollEnabled = true
        let cellType = cellTypes[indexPath.row]
        switch cellType {
        case .info:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: AppConstants.infoIdentifier,
                for: indexPath
            ) as? InfoTableViewCell else { return UITableViewCell() }
            guard let details else { return cell }
            cell.configureCell(model: details)
            cell.backgroundColor = .clear
            return cell
        case .actor:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: AppConstants.actorIdentifier,
                for: indexPath
            ) as? ActorTableViewCell else { return UITableViewCell() }
            guard let details else { return cell }
            cell.configureCell(model: details)
            cell.backgroundColor = .clear
            return cell
        case .recomendation:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: AppConstants.recomendationIdentifier,
                for: indexPath
            ) as? RecomendationTableViewCell else { return UITableViewCell() }
            guard let details else { return cell }
            cell.backgroundColor = .clear
            cell.configureCell(model: details)
            return cell
        }
    }
}
