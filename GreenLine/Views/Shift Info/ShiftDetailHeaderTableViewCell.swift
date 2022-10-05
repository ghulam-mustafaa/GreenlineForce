//
//  ShiftDetailHeaderTableViewCell.swift
//  GreenLine
//
//  Created by EAPPLE on 05/10/2022.
//

import UIKit

class ShiftDetailHeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var cellBGView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    func setupLabel(title: String?) {
        titleLabel.text = title
    }

}
