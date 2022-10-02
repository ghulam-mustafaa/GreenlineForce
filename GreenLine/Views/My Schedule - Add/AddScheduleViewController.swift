//
//  AddScheduleViewController.swift
//  GreenLine
//
//  Created by EAPPLE on 08/09/2022.
//

import UIKit

class AddScheduleViewController: BaseViewController {

    @IBOutlet var scheduleView: AddScheduleView!
    
    var viewModel = AbsencesViewModel()
    var absences = ["Sick Leave", "Unauthorized Absence", "Holiday"]
    var absencesType = [1, 2, 3]
    var selectedAbsence: Int?
    var fromDate: Date?
    var toDate: Date?
    var requestAbsenceDelegate: RequestedAbsence?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scheduleView.tableView.dataSource = self
        scheduleView.tableView.delegate = self
    }
    
    @IBAction
    func selectAbsenceType(_ sender: UIButton) {
        scheduleView.selectAbsenceBGView.isHidden = false
    }
    
    @IBAction
    func saveButtonAction(_ sender: UIButton) {
        let comment = scheduleView.commentTextField.text ?? ""
        viewModel.comment = comment
        LoaderManager.show(view)
        viewModel.requestAbsence(success: {
            self.requestAbsenceDelegate?.absenceDidRequested()
            LoaderManager.hide(self.view)
        }, failure: { error in
            LoaderManager.hide(self.view)
            Utils.showErrorDialog(withError: error, controller: self)
        })
    }
    
    @IBAction
    func fromDatePicker(_ sender: UIDatePicker) {
        fromDate = sender.date
        viewModel.fromDate = fromDate?.sendBirthdayString ?? ""
        scheduleView.fromDateLabel.text = fromDate?.birthdayString
        if toDate != nil {
            let calendar = Calendar.current
            let date1 = calendar.startOfDay(for: fromDate ?? Date())
            let date2 = calendar.startOfDay(for: toDate ?? Date())
            let components = calendar.dateComponents([.day], from: date1, to: date2)
            scheduleView.totalCountLabel.text = "\((components.day ?? 0) + 1)"
        }
    }
    
    @IBAction
    func toDatePicker(_ sender: UIDatePicker) {
        toDate = sender.date
        viewModel.toDate = toDate?.sendBirthdayString ?? ""
        scheduleView.toDateLabel.text = toDate?.birthdayString
        if fromDate != nil {
            let calendar = Calendar.current
            // Replace the hour (time) of both dates with 00:00
            let date1 = calendar.startOfDay(for: fromDate ?? Date())
            let date2 = calendar.startOfDay(for: toDate ?? Date())
            let components = calendar.dateComponents([.day], from: date1, to: date2)
            scheduleView.totalCountLabel.text = "\((components.day ?? 0) + 1)"
        }
    }
    
    @IBAction
    func closeSelectionViewButtonAction(_ sender: UIButton) {
        scheduleView.selectAbsenceBGView.isHidden = true
    }
    
    @IBAction
    func switchButtonAction(_ sender: UISwitch) {
    }
    
    @IBAction
    func selectButtonAction(_ sender: UIButton) {
    }
    
    @IBAction
    func backButtonAction(_ sender: UIButton) {
        dismiss(animated: true)
    }
}

extension AddScheduleViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        scheduleView.selectAbsenceBGView.isHidden = true
        selectedAbsence = absencesType[indexPath.row]
        viewModel.typeId = selectedAbsence
        scheduleView.absenceTypeLabel.text = absences[indexPath.row]
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

extension AddScheduleViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return absences.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: SelectAbsenceTableViewCell = tableView.dequeueCell(for: indexPath)
        cell.nameLabel.text = absences[indexPath.row]
        return cell
    }
}
