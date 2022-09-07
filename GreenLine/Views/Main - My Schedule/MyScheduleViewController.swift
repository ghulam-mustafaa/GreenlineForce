//
//  MyScheduleViewController.swift
//  GreenLine
//
//  Created by EAPPLE on 03/09/2022.
//

import UIKit

class MyScheduleViewController: BaseViewController {

    @IBOutlet var scheduleView: MyScheduleView!
    
    var currentMonth = Date().startOfMonth?.toLocalTime()
    var selectedDate = Date().toLocalTime()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scheduleView.calendarView.delegate = self
    }
    
    @IBAction
    func listButtonAction(_ sender: UIButton) {
    }
    @IBAction
    func addScheduleButtonAction(_ sender: UIButton) {
    }
}

// MARK: - CalendarViewDelegate, CalendarViewDataSource Methods

extension MyScheduleViewController: CalendarViewDelegate {
    func calendarView(_: CalendarView, didSelectDate date: Date) {
        selectedDate = date.toLocalTime()
        scheduleView.monthNameLabel.text = selectedDate.formatDate()
    }
    
    func calendarView(_: CalendarView, didChangeMonth date: Date) {
        currentMonth = date.startOfMonth?.toLocalTime()
        scheduleView.monthNameLabel.text = date.toLocalTime().formatDate()
    }
}
