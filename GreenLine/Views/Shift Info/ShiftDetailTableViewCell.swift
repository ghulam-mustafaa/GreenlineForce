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
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
