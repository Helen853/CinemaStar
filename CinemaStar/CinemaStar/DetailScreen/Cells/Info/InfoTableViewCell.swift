// InfoTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка с информацией о фильме
final class InfoTableViewCell: UITableViewCell {
    private let filmImageView = UIImageView()
    private let nameLabel = UILabel()
    private let button = UIButton()
    private let descriptionLabel = UILabel()
    private let infoLabel = UILabel()

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .clear
        setupImage()
        configureLabel()
        configureButton()
        configureInfo()
        configureDescriprion()
        setupConsctraint()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupImage()
        configureLabel()
        configureButton()
        configureInfo()
        configureDescriprion()
        setupConsctraint()
    }

    // MARK: - Public Methods

    func configureCell(model: FilmsDetail) {
        let rating = String(format: "%.1f", floor(model.rating * 10) / 10)
        nameLabel.text = "\(model.name) \n ⭐️ \(rating)"
        descriptionLabel.text = model.description
        infoLabel.text = "\(model.year)/ \(model.country)/ \(model.type)"
    }

    func configureImage(image: UIImage) {
        filmImageView.image = image
    }

    // MARK: - Private Methods

    private func setupConsctraint() {
        configureImageConstraint()
        configureLabelConstraint()
        configureButtonConstraint()
        configureDescriptionConstraint()
        configureInfoConstraint()
    }

    private func setupImage() {
        contentView.addSubview(filmImageView)
        filmImageView.clipsToBounds = true
        filmImageView.contentMode = .scaleAspectFill
        filmImageView.layer.cornerRadius = 8
    }

    private func configureLabel() {
        contentView.addSubview(nameLabel)
        nameLabel.textColor = .white
        nameLabel.numberOfLines = 0
        nameLabel.font = UIFont(name: AppConstants.inter, size: 16)
        nameLabel.textAlignment = .left
    }

    private func configureImageConstraint() {
        filmImageView.translatesAutoresizingMaskIntoConstraints = false
        filmImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        filmImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 204).isActive = true
        filmImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        filmImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        filmImageView.isUserInteractionEnabled = true
    }

    private func configureLabelConstraint() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.leadingAnchor.constraint(equalTo: filmImageView.trailingAnchor, constant: 16).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -18).isActive = true
        nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 129).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }

    private func configureButton() {
        contentView.addSubview(button)
        button.setTitle(AppConstants.see, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.1066116169, green: 0.3222239017, blue: 0.2897432446, alpha: 1)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
    }

    private func configureButtonConstraint() {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        button.topAnchor.constraint(equalTo: filmImageView.bottomAnchor, constant: 16).isActive = true
        button.widthAnchor.constraint(equalToConstant: 358).isActive = true
        button.heightAnchor.constraint(equalToConstant: 48).isActive = true
        // button.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }

    private func configureDescriprion() {
        contentView.addSubview(descriptionLabel)
        descriptionLabel.textColor = .white
        descriptionLabel.numberOfLines = 0
        descriptionLabel.text = "descr"
        descriptionLabel.font = UIFont(name: AppConstants.inter, size: 14)
        descriptionLabel.textAlignment = .left
    }

    private func configureDescriptionConstraint() {
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 16).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 16).isActive = true
        descriptionLabel.widthAnchor.constraint(equalToConstant: 330).isActive = true
    }

    private func configureInfo() {
        contentView.addSubview(infoLabel)
        infoLabel.textColor = UIColor(red: 1 / 255, green: 1 / 255, blue: 1 / 255, alpha: 0.41)
        infoLabel.text = "2017"
        infoLabel.font = UIFont(name: AppConstants.inter, size: 14)
        infoLabel.textAlignment = .left
    }

    private func configureInfoConstraint() {
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16).isActive = true
        infoLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        infoLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        infoLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
    }
}