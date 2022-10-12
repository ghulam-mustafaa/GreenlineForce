//
//  ShiftInfoViewController.swift
//  GreenLine
//
//  Created by EAPPLE on 05/10/2022.
//

import UIKit 

enum ShiftInfoTableViewCell: Int {
    case info = 0, position, location, time, shiftBreak,
         assignee, pay, rate, totalPay, empty, notes, clockHistory
}

class ShiftInfoViewController: BaseViewController {

    @IBOutlet var infoView: ShiftInfoView!
    
    var shift: Shift?
    var viewModel = ScheduleViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        infoView.tableView.delegate = self
        infoView.tableView.dataSource = self
    }
    
    @IBAction
    func backButtonAction(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction
    func cancelShiftButtonAction(_ sender: UIButton) {
        LoaderManager.show(view)
        viewModel.cancelShift(id: shift?.id, success: {
            LoaderManager.hide(self.view)
            self.navigationController?.popViewController(animated: true)
        }, failure: { error in
            LoaderManager.hide(self.view)
            Utils.showErrorDialog(withError: error, controller: self)
        })
    }
}

extension ShiftInfoViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 || indexPath.row == 6 || indexPath.row == 9 {
           return 40
        } else {
            return 70
        }
    }
}

extension ShiftInfoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let shiftCell = ShiftInfoTableViewCell(rawValue: indexPath.row)
        switch shiftCell {
            case .info:
                let cell: ShiftDetailHeaderTableViewCell = tableView.dequeueCell(for: indexPath)
                cell.setupLabel(title: "INFO")
                return cell
            case .position:
                let cell: ShiftDetailTableViewCell = tableView.dequeueCell(for: indexPath)
                cell.setupData(icon: "person_icon", title: "Position", info: shift?.positionName)
                return cell
            case .location:
                let cell: ShiftDetailTableViewCell = tableView.dequeueCell(for: indexPath)
                cell.setupData(icon: "location_marker_icon", title: "Location", info: shift?.locationName)
                return cell
            case .time:
                let cell: ShiftDetailTableViewCell = tableView.dequeueCell(for: indexPath)
                cell.setupData(icon: "time_clock", title: "Time", info: nil)
                return cell
            case .shiftBreak:
                let cell: ShiftDetailTableViewCell = tableView.dequeueCell(for: indexPath)
                cell.setupData(icon: "pause_icon", title: "Break", info: nil)
                return cell
            case .assignee:
                let cell: ShiftDetailTableViewCell = tableView.dequeueCell(for: indexPath)
                cell.setupData(icon: "person_icon", title: "Assignee", info: nil)
                return cell
            case .pay:
                let cell: ShiftDetailHeaderTableViewCell = tableView.dequeueCell(for: indexPath)
                cell.setupLabel(title: "PAY")
                return cell
            case .rate:
                let cell: ShiftDetailTableViewCell = tableView.dequeueCell(for: indexPath)
                cell.setupData(icon: "pound_icon", title: "Rate", info: nil)
                return cell
            case .totalPay:
                let cell: ShiftDetailTableViewCell = tableView.dequeueCell(for: indexPath)
                cell.setupData(icon: "pay_icon", title: "Total Pay", info: nil)
                return cell
            case .empty:
                let cell: ShiftDetailHeaderTableViewCell = tableView.dequeueCell(for: indexPath)
                cell.setupLabel(title: nil)
                return cell
            case .notes:
                let cell: ShiftDetailTableViewCell = tableView.dequeueCell(for: indexPath)
                cell.setupData(icon: "notes_icon", title: "Notes", info: nil)
                return cell
            case .clockHistory:
                let cell: ShiftDetailTableViewCell = tableView.dequeueCell(for: indexPath)
                cell.setupData(icon: "clock_history", title: "Clock History", info: nil)
                return cell
            default:
                let cell: ShiftDetailHeaderTableViewCell = tableView.dequeueCell(for: indexPath)
                cell.setupLabel(title: nil)
                return cell
        }
    }
}
