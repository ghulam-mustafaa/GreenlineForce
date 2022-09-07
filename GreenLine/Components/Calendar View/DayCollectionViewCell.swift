//
//  DayCollectionViewCell.swift
//  Yelper-ios
//
//  Created by BrainX Technologies IOS 4 on 16/05/2022.
//

import UIKit

class DayCollectionViewCell: UICollectionViewCell {
    private lazy var dayLabel: UILabel = {
        let label = UILabel()
        label.font = .boldMontserrat(ofSize: 14)
        label.textColor = .white
        label.text = "Mon"
        label.textAlignment = .center
        return label
    }()

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        dayLabel.fixInView(contentView)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        dayLabel.fixInView(contentView)
    }

    // MARK: - Public Methods

    func setDay(_ day: String) {
        dayLabel.text = day
    }
}
