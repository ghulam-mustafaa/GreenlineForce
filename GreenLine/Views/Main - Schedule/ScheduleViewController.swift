//
//  ScheduleViewController.swift
//  GreenLine
//
//  Created by BrainX Technologies IOS 4 on 04/08/2022.
//

import UIKit

class ScheduleViewController: BaseViewController {

    @IBOutlet var scheduleView: ScheduleView!
    
    var currentMonth = Date().startOfMonth?.toLocalTime()
    var selectedDate = Date().toLocalTime()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scheduleView.calendarView.delegate = self
        scheduleView.tableView.delegate = self
        scheduleView.tableView.dataSource = self
    }
}

extension ScheduleViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ShiftsViewController.instantiate(from: .Main)
        vc.isFromSchedule = true
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }
}

extension ScheduleViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ScheduleTableViewCell = tableView.dequeueCell(for: indexPath)
        return cell
    }
}
 
// MARK: - CalendarViewDelegate, CalendarViewDataSource Methods

extension ScheduleViewController: CalendarViewDelegate {
    func calendarView(_: CalendarView, didSelectDate date: Date) {
        selectedDate = date.toLocalTime()
        scheduleView.monthNameLabel.text = selectedDate.formatDate()
    }
    
    func calendarView(_: CalendarView, didChangeMonth date: Date) {
        currentMonth = date.startOfMonth?.toLocalTime()
        scheduleView.monthNameLabel.text = date.toLocalTime().formatDate()
    }
}
