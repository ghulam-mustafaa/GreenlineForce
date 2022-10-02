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

class AbsencesViewController: BaseViewController {

    @IBOutlet var absencesView: AbsencesView!
    
    var viewModel = AbsencesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getAbsenceQuota()
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
    }
}
