//
//  GetUserEmailViewController.swift
//  GreenLine
//
//  Created by BrainX Technologies IOS 4 on 31/07/2022.
//

import UIKit

class GetUserEmailViewController: BaseViewController {

    @IBOutlet var loginView: GetUserEmailView!
    
    var viewModel = UserEmailViewModel()
    
    @IBAction
    func nextButtonAction(_ sender: UIButton) {
        let email = loginView.emailAddressTextField.text ?? ""
        viewModel.email = email
        let validationState = viewModel.validateInput()
        switch validationState {
            case .valid:
                let vc = ChooseYourTeamViewController.instantiate(from: .Main)
                vc.email = viewModel.email
                navigationController?.pushViewController(vc, animated: true)
            case .invalid(let message):
                Utils.showErrorDialog(withError: GreenlineError(message: message), controller: self)
        }
    }
}
