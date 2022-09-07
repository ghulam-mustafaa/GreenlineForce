////
////  DateCollectionViewCell.swift
////  Tespo Health
////
////  Created by BrainX Technologies 11 on 24/03/2021.
////  Copyright © 2021 BrainX Technologies. All rights reserved.
////

import UIKit

class DateCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet var dayLabel: UILabel!
    @IBOutlet var dayView: UIView!
    @IBOutlet var badgeViews: [UIView]!
    @IBOutlet var badgeStackView: UIStackView!
    @IBOutlet var activeBadgeView: UIView!
    @IBOutlet var cancelledBadgeView: UIView!
    @IBOutlet var invoiceSentBadgeView: UIView!
    
    // MARK: - Lifecycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setAppearance()
    }
    
    // MARK: - Private Properties
    
    private func setAppearance() {
        dayLabel.font = .mediumMontserrat(ofSize: 14)
        dayLabel.textColor = .white
        dayView.makeRoundCorners(cornerRadius: dayView.frame.width / 2)
        dayView.layer.borderColor = UIColor.brown.cgColor
    }
    
    private func setDayView(isHidden: Bool, _ shouldNotHighlight: Bool = false) {
        if isHidden {
            dayView.backgroundColor = .clear
//            dayView.layer.borderWidth = 0
            dayLabel.textColor = shouldNotHighlight ? .white.withAlphaComponent(0.5) : .white
        } else {
            dayView.backgroundColor = .white
            dayLabel.textColor = .black
//            dayView.layer.borderWidth = 1
        }
    }
    
    // MARK: - Public Methods
    
    func setDate(_ date: String, shouldNotHighlight: Bool, showMarker: Bool) {
        dayLabel.text = date
        setDayView(isHidden: !showMarker, shouldNotHighlight)
//        badgeStackView.isHidden = shouldNotHighlight
//        dayLabel.isHidden = shouldNotHighlight
    }
}
