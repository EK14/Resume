//
//  SkillCell.swift
//  skillsCollectionView
//
//  Created by Элина Карапетян on 07.08.2023.
//

import UIKit

class SkillCell: UICollectionViewCell {
    static let reuseIdentifier = String(describing: SkillCell.self)

    var onCloseTapped: (() -> Void)?

    private let skillTextLabel = UILabel()
    private let closeButton = UIButton()

    private var textTrailing: NSLayoutConstraint?
    private var textClosedButtonTrailing: NSLayoutConstraint?
    private var cellWidth: NSLayoutConstraint?

    override init(frame: CGRect) {
        super.init(frame: .zero)

        setupLayout()
        setupStyle()
        setUp()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupLayout() {

        skillTextLabel.translatesAutoresizingMaskIntoConstraints = false
        closeButton.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(skillTextLabel)
        contentView.addSubview(closeButton)

        textTrailing = skillTextLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24)
        textTrailing?.isActive = true

        textClosedButtonTrailing = skillTextLabel.trailingAnchor.constraint(equalTo: closeButton.leadingAnchor, constant: -10)

        contentView.widthAnchor.constraint(lessThanOrEqualToConstant:  200).isActive = true

        NSLayoutConstraint.activate([
            skillTextLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            skillTextLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            skillTextLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),

            closeButton.widthAnchor.constraint(equalToConstant: 16),
            closeButton.heightAnchor.constraint(equalToConstant: 16),
            closeButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            closeButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            closeButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12)
        ])
    }

    private func setupStyle() {

        contentView.backgroundColor = UIColor(named: "Gray2")
        contentView.layer.cornerRadius = 12

        skillTextLabel.textColor = .black
        skillTextLabel.font = .systemFont(ofSize: 16)
        skillTextLabel.adjustsFontSizeToFitWidth = true
        skillTextLabel.minimumScaleFactor = 0.8
        skillTextLabel.lineBreakMode = .byTruncatingTail

        closeButton.tintColor = .black
        closeButton.setImage(UIImage(systemName: "xmark"), for: .normal)
    }

    func configure(model: String, isEditMode: Bool, maxWidth: CGFloat) {
        contentView.layoutIfNeeded()

        skillTextLabel.text = model
        skillTextLabel.invalidateIntrinsicContentSize()

        closeButton.isHidden = !isEditMode

        textTrailing?.isActive = !isEditMode
        textClosedButtonTrailing?.isActive = isEditMode

        cellWidth?.constant = maxWidth
    }

    private func setUp() {
        closeButton.addTarget(self, action: #selector(didTapClose), for: .touchUpInside)
    }

    @objc private func didTapClose() {
        onCloseTapped?()
    }
}
