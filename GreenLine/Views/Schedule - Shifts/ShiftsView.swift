//
//  ShiftsView.swift
//  GreenLine
//
//  Created by EAPPLE on 03/09/2022.
//

import UIKit

class ShiftsView: UIView {

    @IBOutlet weak var shiftsBGView: UIView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var monthYearLabel: UILabel!
    @IBOutlet weak var locationBGView: UIView!
    @IBOutlet weak var locationMarkerIcon: UIImageView!
    @IBOutlet weak var locationNameLabel: UILabel!
    @IBOutlet weak var expandRightIcon: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    
    func setupViews(_ isFromSchedule: Bool) {
        backButton.isHidden = !isFromSchedule
    }
}
