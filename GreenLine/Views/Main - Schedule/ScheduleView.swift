//
//  ScheduleView.swift
//  GreenLine
//
//  Created by BrainX Technologies IOS 4 on 04/08/2022.
//

import UIKit

class ScheduleView: UIView {

    @IBOutlet weak var scheduleBGView: UIView!
    @IBOutlet weak var scheduleBottomView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var monthNameLabel: UILabel!
    @IBOutlet weak var scheduleTitleLabel: UILabel!
    @IBOutlet weak var searchBGView: UIView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var calendarView: CalendarView!
    @IBOutlet weak var noScheduleIcon: UIImageView!
    @IBOutlet weak var noScheduleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        scheduleBottomView.setCornerRadius(16, forCorners: [.layerMinXMinYCorner, .layerMaxXMinYCorner])
    }
    
    func showEmptyView(_ shouldShow: Bool) {
        noScheduleIcon.isHidden = !shouldShow
        noScheduleLabel.isHidden = !shouldShow
        tableView.isHidden = shouldShow
    }
}
