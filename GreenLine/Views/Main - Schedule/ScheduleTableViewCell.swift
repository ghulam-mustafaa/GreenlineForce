//
//  ScheduleTableViewCell.swift
//  GreenLine
//
//  Created by BrainX Technologies IOS 4 on 04/08/2022.
//

import UIKit

class ScheduleTableViewCell: UITableViewCell {

    @IBOutlet weak var cellBGView: UIView!
    @IBOutlet weak var roundGreenView: UIView!
    @IBOutlet weak var roundWhiteView: UIView!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var locationTitleLabel: UILabel!
    @IBOutlet weak var shiftAllocatedLabel: UILabel!
    
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
