//
//  ChooseYourTeamTableViewCell.swift
//  GreenLine
//
//  Created by BrainX Technologies IOS 4 on 31/07/2022.
//

import UIKit

class ChooseYourTeamTableViewCell: UITableViewCell {

    @IBOutlet weak var cellBGView: UIView!
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var teamWebsiteLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
        cellBGView.setBorderWidth(width: 1)
        cellBGView.setBorderColor(color: .textFieldBorderColor)
        cellBGView.setCornerRadius(16)
    }
}
