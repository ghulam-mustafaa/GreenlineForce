//
//  ProfileViewController.swift
//  GreenLine
//
//  Created by EAPPLE on 10/09/2022.
//

import UIKit

class ProfileViewController: BaseViewController {

    @IBOutlet var profileView: ProfileView!
    
    var viewModel = ProfileViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        profileView.setupProfileData()
        viewModel.firstName = SessionManager.shared.user?.firstName ?? ""
        viewModel.lastName = SessionManager.shared.user?.lastName ?? ""
        viewModel.password = SessionManager.shared.user?.password ?? ""
        viewModel.email = SessionManager.shared.user?.email ?? ""
        viewModel.phone = SessionManager.shared.user?.phone ?? ""
        [profileView.firstNameTextField,
         profileView.lastNameTextField,
         profileView.passwordTextField,
         profileView.phoneNumberTextField].forEach({
            $0?.delegate = self
        })
    }
    
    @IBAction
    func crossButtonAction(_ sender: UIButton) {
        profileView.hideEditView(true)
    }
    
    @IBAction
    func editButtonAction(_ sender: UIButton) {
        profileView.hideEditView(false)
    }
    
    @IBAction
    func backButtonAction(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction
    func selectGenderButtonAction(_ sender: UIButton) {
    }
    
    @IBAction
    func updateButtonAction(_ sender: UIButton) {
        viewModel.updateProfile(success: {
            SessionManager.shared.user?.firstName = self.viewModel.firstName
            SessionManager.shared.user?.lastName = self.viewModel.lastName
            SessionManager.shared.user?.password = self.viewModel.password
            SessionManager.shared.user?.phone = self.viewModel.phone
        }, failure: { error in
            Utils.showErrorDialog(withError: error, controller: self)
        })
    }
}

// MARK: - Extension TextFiled delegate

extension ProfileViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text as NSString? {
            let txtAfterUpdate = text.replacingCharacters(in: range, with: string)
            if textField == profileView.firstNameTextField {
                viewModel.firstName = txtAfterUpdate
            }
            if textField == profileView.lastNameTextField {
                viewModel.lastName = txtAfterUpdate
            }
            if textField == profileView.passwordTextField {
                viewModel.password = txtAfterUpdate
            }
            if textField == profileView.phoneNumberTextField {
                viewModel.phone = txtAfterUpdate
            }
        }
        return true
    }
}
