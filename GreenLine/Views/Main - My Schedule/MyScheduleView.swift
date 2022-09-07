//
//  MyScheduleView.swift
//  GreenLine
//
//  Created by EAPPLE on 03/09/2022.
//

import UIKit

class MyScheduleView: UIView {

    @IBOutlet weak var scheduleBGView: UIView!
    @IBOutlet weak var scheduleBottomView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var noScheduleIcon: UIImageView!
    @IBOutlet weak var noScheduleLabel: UILabel!
    @IBOutlet weak var monthNameLabel: UILabel!
    @IBOutlet weak var myScheduleLabel: UILabel!
    @IBOutlet weak var calendarView: CalendarView!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var listButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        scheduleBottomView.setCornerRadius(16, forCorners: [.layerMinXMinYCorner, .layerMaxXMinYCorner])
    }
}
