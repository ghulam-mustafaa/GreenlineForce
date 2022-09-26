//
//  ForgotPasswordViewController.swift
//  GreenLine
//
//  Created by EAPPLE on 26/09/2022.
//

import UIKit

class ForgotPasswordViewController: BaseViewController {

    @IBOutlet var passwordView: ForgotPasswordView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction
    func backButtonAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction
    func sendButtonAction(_ sender: UIButton) {
    }
}
