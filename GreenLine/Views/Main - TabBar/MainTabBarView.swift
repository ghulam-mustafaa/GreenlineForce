//
//  MainTabBarView.swift
//  GreenLine
//
//  Created by BrainX Technologies IOS 4 on 03/08/2022.
//

import UIKit

class MainTabBarView: UIView {

    @IBOutlet weak var tabsContainerView: UIView!
    @IBOutlet weak var tabsBGView: UIView!
    @IBOutlet weak var tabsStackView: UIStackView!
    @IBOutlet weak var scheduleTabView: UIView!
    @IBOutlet weak var scheduleTabLabel: UILabel!
    @IBOutlet weak var scheduleTabIcon: UIImageView!
    @IBOutlet weak var myScheduleTabView: UIView!
    @IBOutlet weak var myScheduleTabLabel: UILabel!
    @IBOutlet weak var myScheduleTabIcon: UIImageView!
    @IBOutlet weak var timeClockTabView: UIView!
    @IBOutlet weak var timeClockTabLabel: UILabel!
    @IBOutlet weak var timeClockTabIcon: UIImageView!
    @IBOutlet weak var moreTabView: UIView!
    @IBOutlet weak var moreTabLabel: UILabel!
    @IBOutlet weak var moreTabIcon: UIImageView!
    @IBOutlet weak var moreTabBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var timeClockTabBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var myScheduleTabBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var scheduleTabBottomConstraint: NSLayoutConstraint!
        
    func setActiveView( newTab: MainTab, oldTab: MainTab){
        layoutIfNeeded()
        removeActiveTab(oldTab)
        switch newTab {
        case .schedule:
            scheduleTabLabel.isHidden = false
            scheduleTabBottomConstraint.constant = 14
            scheduleTabIcon.image = UIImage(named: "schedule_active")
        case .mySchedule:
            myScheduleTabLabel.isHidden = false
            myScheduleTabBottomConstraint.constant = 14
            myScheduleTabIcon.image = UIImage(named: "my_schedule_active")
        case .timeClock:
            timeClockTabLabel.isHidden = false
            timeClockTabBottomConstraint.constant = 14
            timeClockTabIcon.image = UIImage(named: "time_clock_active")
        case .more:
            moreTabLabel.isHidden = false
            moreTabBottomConstraint.constant = 14
            moreTabIcon.image = UIImage(named: "more_active")
        }
    }
    
    private func removeActiveTab(_ tab: MainTab){
        switch tab {
        case .schedule:
            scheduleTabLabel.isHidden = true
            scheduleTabBottomConstraint.constant = 4
            scheduleTabIcon.image = UIImage(named: "schedule_inactive")
        case .mySchedule:
            myScheduleTabLabel.isHidden = true
            myScheduleTabBottomConstraint.constant = 4
            myScheduleTabIcon.image = UIImage(named: "my_schedule_inactive")
        case .timeClock:
            timeClockTabLabel.isHidden = true
            timeClockTabBottomConstraint.constant = 4
            timeClockTabIcon.image = UIImage(named: "time_clock_inactive")
        case .more:
            moreTabLabel.isHidden = true
            moreTabBottomConstraint.constant = 4
            moreTabIcon.image = UIImage(named: "more_inactive")
        }
    }
}
