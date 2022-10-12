//
//  MyScheduleTableViewCell.swift
//  GreenLine
//
//  Created by EAPPLE on 13/10/2022.
//

import UIKit

class MyScheduleTableViewCell: UITableViewCell {

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
    
    func setupData(_ location: Location, count: Int) {
        locationTitleLabel.text = location.name
        countLabel.text = "\(count)"
    }
}
