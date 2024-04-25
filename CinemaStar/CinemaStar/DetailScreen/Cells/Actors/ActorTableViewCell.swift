// ActorTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка с актерами
final class ActorTableViewCell: UITableViewCell {
    private let nameLabel = UILabel()
    private let languageTitleLabel = UILabel()
    private let languageLabel = UILabel()
    private var collectionView: UICollectionView?
    var film: FilmsDetail? {
        didSet {
            collectionView?.reloadData()
        }
    }

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUi()
        setupCinstraint()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUi()
        setupCinstraint()
    }

    // MARK: - Public Methods

    func configureCell(model: FilmsDetail) {
        languageLabel.text = model.spokenLanguages?.first
        film = model
    }

    // MARK: - Private Methods

    private func setupUi() {
        configureNameLabel()
        configureLanguageTitle()
        configureLanguage()
        configureCollectionView()
    }

    private func setupCinstraint() {
        configureNameConstraint()
        configureLanguageTitleConstraint()
        configureLanguageConstraint()
        configureCollectionConstraint()
    }

    private func configureNameLabel() {
        contentView.addSubview(nameLabel)
        nameLabel.textColor = .white
        nameLabel.text = AppConstants.actorText
        nameLabel.font = UIFont(name: AppConstants.interBold, size: 14)
        nameLabel.textAlignment = .left
    }

    private func configureLanguageTitle() {
        contentView.addSubview(languageTitleLabel)
        languageTitleLabel.textColor = .white
        languageTitleLabel.text = AppConstants.languge
        languageTitleLabel.font = UIFont(name: AppConstants.interBold, size: 14)
        languageTitleLabel.textAlignment = .left
    }

    private func configureLanguage() {
        contentView.addSubview(languageLabel)
        languageLabel.textColor = .darkGray
        languageLabel.font = UIFont(name: AppConstants.interBold, size: 14)
        languageLabel.textAlignment = .left
    }

    private func configureCollectionView() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: setupFlowLayout())
        guard let collectionView = collectionView else { return }
        contentView.addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        collectionView.register(
            ActorsCollectionViewCell.self,
            forCellWithReuseIdentifier: AppConstants.actorCollectionIdentifier
        )
    }

    private func setupFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 12
        layout.minimumInteritemSpacing = 12
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 60, height: 96)
        return layout
    }

    private func configureNameConstraint() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
    }

    private func configureLanguageTitleConstraint() {
        languageTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        languageTitleLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 121).isActive = true
        languageTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
    }

    private func configureLanguageConstraint() {
        languageLabel.translatesAutoresizingMaskIntoConstraints = false
        languageLabel.topAnchor.constraint(equalTo: languageTitleLabel.bottomAnchor, constant: 4).isActive = true
        languageLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        languageLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
    }

    private func configureCollectionConstraint() {
        collectionView?.translatesAutoresizingMaskIntoConstraints = false
        collectionView?.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10).isActive = true
        collectionView?.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        collectionView?.heightAnchor.constraint(equalToConstant: 100).isActive = true
        collectionView?.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    }
}

extension ActorTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        film?.persons?.count ?? 1
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: AppConstants.actorCollectionIdentifier,
            for: indexPath
        ) as? ActorsCollectionViewCell else { return UICollectionViewCell() }
        guard let person = film?.persons?[indexPath.row] else { return cell }
        cell.configure(actors: person)
        return cell
    }
}
