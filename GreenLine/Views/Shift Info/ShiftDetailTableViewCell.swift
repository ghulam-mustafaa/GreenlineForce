//
//  ShiftDetailTableViewCell.swift
//  GreenLine
//
//  Created by EAPPLE on 05/10/2022.
//

import UIKit

class ShiftDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var cellBGView: UIView!
    @IBOutlet weak var detailIcon: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var shiftInfoLabel: UILabel!
    
    func setupData(icon: String, title: String, info: String?) {
        detailIcon.image = UIImage(named: icon)
        titleLabel.text = title
        shiftInfoLabel.text = info ?? "---"
    }
}
