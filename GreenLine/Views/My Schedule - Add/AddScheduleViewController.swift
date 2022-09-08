//
//  AddScheduleViewController.swift
//  GreenLine
//
//  Created by EAPPLE on 08/09/2022.
//

import UIKit

class AddScheduleViewController: BaseViewController {

    @IBOutlet var scheduleView: AddScheduleView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
