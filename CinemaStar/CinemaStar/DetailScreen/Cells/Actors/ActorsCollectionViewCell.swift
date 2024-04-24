// ActorsCollectionViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка с катерами
final class ActorsCollectionViewCell: UICollectionViewCell {
    private let nameLabel = UILabel()
    private let photoImageView = UIImageView()

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
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

    func configure(actors: Person) {
        nameLabel.text = actors.name.replacingOccurrences(of: " ", with: "\n")
    }

    func configureImage(image: UIImage) {
        photoImageView.image = image
    }

    // MARK: - Private Methods

    private func setupUi() {
        configureLabel()
        configureImage()
    }

    private func setupCinstraint() {
        configureImageConstraint()
        configureLabelConstraint()
    }

    private func configureLabel() {
        contentView.addSubview(nameLabel)
        nameLabel.textColor = .white
        nameLabel.font = UIFont(name: AppConstants.inter, size: 8)
        nameLabel.textAlignment = .center
    }

    private func configureImage() {
        contentView.addSubview(photoImageView)
    }

    private func configureLabelConstraint() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: 2).isActive = true
        nameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        nameLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }

    private func configureImageConstraint() {
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        photoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 6).isActive = true
        photoImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8).isActive = true
    }
}
