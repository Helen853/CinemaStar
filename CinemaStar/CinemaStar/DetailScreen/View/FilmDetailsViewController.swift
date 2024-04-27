// FilmDetailsViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран с деталями фильма
final class FilmDetailsViewController: UIViewController {
    // MARK: - Visual Components

    private let tableView = UITableView()
    private let backButton = UIButton()
    private let favoritesButton = UIButton()
    private let cellTypes: [DetailType] = [.info, .description, .actor, .recomendation]

    // MARK: - Public Properties

    var detailsViewModel: DetailsViewModelProtocol?
    var tappedTextHandler: VoidHandler?
    var tappedBottonHandler: VoidHandler?

    // MARK: - Private Properties

    private var details: FilmDetail?

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureBar()
        configureTable()
        registerCell()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        detailsViewModel?.callService()
        loadFilms()
        tappedMoreText()
        tappedSee()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        updateColorButton()
        detailsViewModel?.returnStateButton()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setGradient()
    }

    // MARK: - Private Methods

    private func loadFilms() {
        detailsViewModel?.filmsLoadedHandler = { [weak self] response in
            self?.details = response
            Task {
                await MainActor.run {
                    self?.tableView.reloadData()
                }
            }
        }
    }

    private func tappedMoreText() {
        tappedTextHandler = { [weak self] in
            guard let self = self else { return }
            tableView.beginUpdates()
            tableView.setNeedsDisplay()
            tableView.endUpdates()
        }
    }

    private func tappedSee() {
        tappedBottonHandler = { [weak self] in
            guard let self = self else { return }
            showAlert()
        }
    }

    private func showAlert() {
        let alert = UIAlertController(title: "Упс!", message: "Функционал в разработке :(", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel))
        present(alert, animated: true)
    }

    private func updateColorButton() {
        detailsViewModel?.favoritesHandler = { [weak self] state in
            guard let self = self else { return }
            switch state {
            case .clear:
                favoritesButton.setImage(UIImage(named: AppConstants.favoritesButtonName), for: .normal)
            case .white:
                favoritesButton.setImage(UIImage(named: AppConstants.fullFavoritesButtonName), for: .normal)
            }
        }
    }

    private func configureBar() {
        backButton.setImage(UIImage(named: AppConstants.backButtonName), for: .normal)
        let leftBarButton = UIBarButtonItem(customView: backButton)
        let rightBarButton = UIBarButtonItem(customView: favoritesButton)
        navigationItem.setRightBarButton(rightBarButton, animated: true)
        navigationItem.setLeftBarButton(leftBarButton, animated: true)
        backButton.addTarget(self, action: #selector(tappedBack), for: .touchUpInside)
        favoritesButton.addTarget(self, action: #selector(tappedSave), for: .touchUpInside)
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
        tableView.register(DescriptionTableViewCell.self, forCellReuseIdentifier: AppConstants.descriptionIdentifier)
    }

    @objc private func tappedBack() {
        detailsViewModel?.showMainScreen()
    }

    @objc private func tappedSave() {
        guard let film = details else { return }
        detailsViewModel?.saveFavorites(film: film)
        detailsViewModel?.returnStateButton()
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
            cell.configureCell(model: details, closure: tappedBottonHandler)
            cell.backgroundColor = .clear
            return cell
        case .description:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: AppConstants.descriptionIdentifier,
                for: indexPath
            ) as? DescriptionTableViewCell else { return UITableViewCell() }
            guard let details else { return cell }
            cell.configureCell(model: details, closure: tappedTextHandler)
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
