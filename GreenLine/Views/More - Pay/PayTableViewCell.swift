//
//  PayTableViewCell.swift
//  GreenLine
//
//  Created by EAPPLE on 09/09/2022.
//

import UIKit

class PayTableViewCell: UITableViewCell {

    @IBOutlet weak var cellBGView: UIView!
    @IBOutlet weak var payLabel: UILabel!
    @IBOutlet weak var expandRightIcon: UIImageView!
    @IBOutlet weak var downloadIcon: UIImageView!
    @IBOutlet weak var payTenureLabel: UILabel!
    @IBOutlet weak var downloadLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
        cellBGView.setBorderColor(color: .textFieldBorderColor)
        cellBGView.setBorderWidth(width: 1)
    }
}
