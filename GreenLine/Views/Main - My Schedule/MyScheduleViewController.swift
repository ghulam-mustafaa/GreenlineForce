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
    var selectedDate = Date().iso8601
    var viewModel = ScheduleViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scheduleView.calendarView.delegate = self
        scheduleView.tableView.delegate = self
        scheduleView.tableView.dataSource = self
        self.scheduleView.showEmptyView(self.viewModel.shifts.isEmpty)
        getAllShifts()
    }
    
    private func getAllShifts() {
        LoaderManager.show(view)
        viewModel.getAllShifts(date: selectedDate, success: {
            LoaderManager.hide(self.view)
            self.scheduleView.showEmptyView(self.viewModel.shifts.isEmpty)
            self.scheduleView.tableView.reloadData()
        }, failure: { error in
            LoaderManager.hide(self.view)
            Utils.showErrorDialog(withError: error, controller: self)
        })
    }
    
    @IBAction
    func listButtonAction(_ sender: UIButton) {
    }
    
    @IBAction
    func addScheduleButtonAction(_ sender: UIButton) {
        let vc = AddScheduleViewController.instantiate(from: .Main)
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
}

// MARK: - CalendarViewDelegate, CalendarViewDataSource Methods

extension MyScheduleViewController: CalendarViewDelegate {
    func calendarView(_: CalendarView, didSelectDate date: Date) {
        selectedDate = date.iso8601
        scheduleView.monthNameLabel.text = selectedDate.date?.formatDate()
        getAllShifts()
    }
    
    func calendarView(_: CalendarView, didChangeMonth date: Date) {
        currentMonth = date.startOfMonth?.toLocalTime()
        scheduleView.monthNameLabel.text = date.toLocalTime().formatDate()
    }
}

extension MyScheduleViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let location = viewModel.searchedLocations[indexPath.row]
        let vc = ShiftsViewController.instantiate(from: .Main)
        vc.isFromSchedule = true
        vc.viewModel.shifts = viewModel.shiftsForLocation[location.id] ?? []
        vc.viewModel.location = location
        vc.delegate = self
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }
}

extension MyScheduleViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.searchedLocations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MyScheduleTableViewCell = tableView.dequeueCell(for: indexPath)
        let location = viewModel.searchedLocations[indexPath.row]
        let shiftsCount = viewModel.shiftsForLocation[location.id]?.count ?? 0
        cell.setupData(location, count: shiftsCount)
        return cell
    }
}

extension MyScheduleViewController: PopViewControllerDelegate {
    func viewControllerDidPopped() {
        getAllShifts()
    }
}
