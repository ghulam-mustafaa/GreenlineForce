//
//  AbsencesViewController.swift
//  GreenLine
//
//  Created by EAPPLE on 08/09/2022.
//

import UIKit

class AbsencesViewController: BaseViewController {

    @IBOutlet var absencesView: AbsencesView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction
    func addButtonAction(_ sender: UIButton) {
        let vc = AddScheduleViewController.instantiate(from: .Main)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction
    func backButtonAction(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
