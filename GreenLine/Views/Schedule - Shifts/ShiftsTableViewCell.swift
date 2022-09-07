//
//  ShiftsTableViewCell.swift
//  GreenLine
//
//  Created by EAPPLE on 03/09/2022.
//

import UIKit

class ShiftsTableViewCell: UITableViewCell {

    @IBOutlet weak var cellBGView: UIView!
    @IBOutlet weak var roundGreenView: UIView!
    @IBOutlet weak var roundWhiteView: UIView!
    @IBOutlet weak var shiftsCountLabel: UILabel!
    @IBOutlet weak var startTimeLabel: UILabel!
    @IBOutlet weak var endTimeLabel: UILabel!
    @IBOutlet weak var shiftNameLabel: UILabel!
    @IBOutlet weak var shiftAllocatedLabel: UILabel!
    @IBOutlet weak var expandDownIcon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
        cellBGView.setBorderColor(color: .textFieldBorderColor)
        cellBGView.setBorderWidth(width: 1)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
