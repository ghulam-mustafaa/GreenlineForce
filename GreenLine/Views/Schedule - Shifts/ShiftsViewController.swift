//
//  ShiftsViewController.swift
//  GreenLine
//
//  Created by EAPPLE on 03/09/2022.
//

import UIKit

class ShiftsViewController: BaseViewController {

    @IBOutlet var shiftsView: ShiftsView!
    
    var isFromSchedule = false
    var viewModel = ShiftsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        shiftsView.setupViews(isFromSchedule)
        shiftsView.tableView.delegate = self
        shiftsView.tableView.dataSource = self
        viewModel.populatePositions()
        shiftsView.locationNameLabel.text = viewModel.location?.name
        shiftsView.monthYearLabel.text = Date().formatDate(toFormat: "EEE, dd MMM")
    }
    
    @IBAction
    func backButtonAction(_ sender: UIButton) {
        dismiss(animated: true)
    }
}

extension ShiftsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // TODO
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }
}

extension ShiftsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.shifts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ShiftsTableViewCell = tableView.dequeueCell(for: indexPath)
        let shift = viewModel.shifts[indexPath.row]
        let positionCount = viewModel.postitionsForShift[shift.positionId ?? -1]?.count ?? 0
        cell.shiftNameLabel.text = shift.positionName
        cell.startTimeLabel.text = shift.shiftStart
        cell.endTimeLabel.text = " -\(shift.shiftEnd ?? "")"
        cell.shiftsCountLabel.text = "\(positionCount)"
        return cell
    }
}

