// DescriptionTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка с описанием фильма
final class DescriptionTableViewCell: UITableViewCell {
    // MARK: - Visual Components

    private let descriptionLabel = UILabel()
    private let infoLabel = UILabel()
    private let moreButton = UIButton()
    private var isTappedText = false
    private var heightConstr: NSLayoutConstraint?

    var tappedTextHandler: VoidHandler?

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUi()
        setupConsctraint()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUi()
        setupConsctraint()
    }

    // MARK: - Public Methods

    func configureCell(model: FilmDetail, closure: VoidHandler?) {
        tappedTextHandler = closure
        descriptionLabel.text = model.description
        guard let country = model.countries else { return }
        infoLabel.text = "\(model.year)/ \(country)/ \(model.type)"
    }

    // MARK: - Private Methods

    private func setupUi() {
        contentView.backgroundColor = .clear
        configureInfo()
        configureDescriprion()
        configureMoreButton()
    }

    private func setupConsctraint() {
        configureDescriptionConstraint()
        configureInfoConstraint()
        configureMoreButtonConstraint()
    }

    private func configureMoreButton() {
        contentView.addSubview(moreButton)
        moreButton.setImage(UIImage(named: AppConstants.buttonName), for: .normal)
        moreButton.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
    }

    private func configureDescriprion() {
        contentView.addSubview(descriptionLabel)
        descriptionLabel.textColor = .white
        descriptionLabel.numberOfLines = 0
        descriptionLabel.font = UIFont(name: AppConstants.inter, size: 14)
        descriptionLabel.textAlignment = .left
    }

    private func configureDescriptionConstraint() {
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        descriptionLabel.widthAnchor.constraint(equalToConstant: 330).isActive = true

        heightConstr = descriptionLabel.heightAnchor.constraint(equalToConstant: 100)
        heightConstr?.isActive = true
    }

    private func configureInfo() {
        contentView.addSubview(infoLabel)
        infoLabel.textColor = .gray
        infoLabel.font = UIFont(name: AppConstants.interBold, size: 14)
        infoLabel.textAlignment = .left
    }

    private func configureInfoConstraint() {
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16).isActive = true
        infoLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        infoLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        infoLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
    }

    private func configureMoreButtonConstraint() {
        moreButton.translatesAutoresizingMaskIntoConstraints = false
        moreButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        moreButton.leadingAnchor.constraint(equalTo: descriptionLabel.trailingAnchor, constant: 6).isActive = true
        moreButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -46).isActive = true
        moreButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
    }

    @objc private func tappedButton() {
        if isTappedText == false {
            heightConstr?.constant = 250
            moreButton.setImage(UIImage(named: AppConstants.upButtonName), for: .normal)
            tappedTextHandler?()
            isTappedText = true
        } else {
            heightConstr?.constant = 100
            moreButton.setImage(UIImage(named: AppConstants.buttonName), for: .normal)
            tappedTextHandler?()
            isTappedText = false
        }
    }
}
