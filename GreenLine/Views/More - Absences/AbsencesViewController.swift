//
//  AbsencesViewController.swift
//  GreenLine
//
//  Created by EAPPLE on 08/09/2022.
//

import UIKit

protocol RequestedAbsence {
    func absenceDidRequested()
}

enum AbsenceStatus: Int {
    case requested = 1, approved, rejected
    
    var title: String {
        switch self {
            case .requested:
                return "Requested"
            case .approved:
                return "Approved"
            case .rejected:
                return "Rejected"
        }
    }
}

class AbsencesViewController: BaseViewController {

    @IBOutlet var absencesView: AbsencesView!
    
    var viewModel = AbsencesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        absencesView.tableView.delegate = self
        absencesView.tableView.dataSource = self
        getAbsenceQuota()
        getAllAbsences()
    }
    
    func getAllAbsences() {
        LoaderManager.show(view)
        var components = Calendar.current.dateComponents([.year], from: Date())
        if let startDateOfYear = Calendar.current.date(from: components) {
            components.year = 1
            components.day = -1
            let lastDateOfYear = Calendar.current.date(byAdding: components, to: startDateOfYear) ?? Date()
            viewModel.getAbsences(fromDate: startDateOfYear.sendBirthdayString, toDate: lastDateOfYear.sendBirthdayString, success: {
                LoaderManager.hide(self.view)
                self.absencesView.tableView.reloadData()
            }, failure: { error in
                LoaderManager.hide(self.view)
                Utils.showErrorDialog(withError: error, controller: self)
            })
        }
    }
    
    func getAbsenceQuota() {
        LoaderManager.show(view)
        viewModel.getAbsenceQuota(success: {
            LoaderManager.hide(self.view)
            self.absencesView.setAbsenceQuotaView(self.viewModel.absenceQuota)
        }, failure: { error in
            LoaderManager.hide(self.view)
            Utils.showErrorDialog(withError: error, controller: self)
        })
    }
    
    @IBAction
    func addButtonAction(_ sender: UIButton) {
        let vc = AddScheduleViewController.instantiate(from: .Main)
        vc.requestAbsenceDelegate = self
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    @IBAction
    func backButtonAction(_ sender: UIButton) {
        dismiss(animated: true)
    }
}

extension AbsencesViewController: RequestedAbsence {
    func absenceDidRequested() {
        dismiss(animated: true)
        getAbsenceQuota()
        getAllAbsences()
    }
}

extension AbsencesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension AbsencesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.absences.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: AbsenceTableViewCell = tableView.dequeueCell(for: indexPath)
        let absence = viewModel.absences[indexPath.row]
        cell.setupAbsenceData(absence)
        return cell
    }
    
    
}
