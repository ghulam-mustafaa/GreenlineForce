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
    var selectedDate = Date().iso8601
    var viewModel = ScheduleViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scheduleView.calendarView.delegate = self
        scheduleView.tableView.delegate = self
        scheduleView.tableView.dataSource = self
        scheduleView.searchTextField.delegate = self
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
}

extension ScheduleViewController: UITableViewDelegate {
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

extension ScheduleViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.searchedLocations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ScheduleTableViewCell = tableView.dequeueCell(for: indexPath)
        let location = viewModel.searchedLocations[indexPath.row]
        let shiftsCount = viewModel.shiftsForLocation[location.id]?.count ?? 0
        cell.setupData(location, count: shiftsCount)
        return cell
    }
}
 
// MARK: - CalendarViewDelegate, CalendarViewDataSource Methods

extension ScheduleViewController: CalendarViewDelegate {
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

// MARK: - Extension TextFiled delegate

extension ScheduleViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text as NSString? {
            let txtAfterUpdate = text.replacingCharacters(in: range, with: string)
            viewModel.searchedLocations = viewModel.locations.filter({ location -> Bool in
                return location.name.lowercased().contains(txtAfterUpdate.lowercased())
            })
        }
        if range.location == 0 && string.count == 0 {
            viewModel.searchedLocations = viewModel.locations
        }
        scheduleView.showEmptyView(viewModel.searchedLocations.isEmpty)
        scheduleView.tableView.reloadData()
        return true
    }
}

extension ScheduleViewController: PopViewControllerDelegate {
    func viewControllerDidPopped() {
        getAllShifts()
    }
}
