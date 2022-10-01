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
        viewModel.populateProfileData()
        [profileView.firstNameTextField,
         profileView.lastNameTextField,
         profileView.phoneNumberTextField,
         profileView.mobileNumberTextField,
         profileView.emergencyContactRelation,
         profileView.emergencyContactPhone,
         profileView.emergencyContactNameTextField,
         profileView.phoneNumberTextField].forEach({
            $0?.delegate = self
        })
    }
    
    @IBAction func birthdayDateChanged(_ sender: UIDatePicker) {
        viewModel.birthdate = sender.date.sendBirthdayString
        profileView.birthdayTextField.text = sender.date.birthdayString
    }
    
    @IBAction
    func accessToCarStatus(_ sender: UISwitch) {
        viewModel.carAccess = sender.isOn
    }
    
    @IBAction
    func changeDrivingLicenseStatus(_ sender: UISwitch) {
        viewModel.drivingStatus = sender.isOn
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
        LoaderManager.show(view)
        viewModel.updateProfile(success: {
            LoaderManager.hide(self.view)
            SessionManager.shared.user?.firstName = self.viewModel.firstName
            SessionManager.shared.user?.lastName = self.viewModel.lastName
            SessionManager.shared.user?.phoneNumber = self.viewModel.phone
            SessionManager.shared.user?.mobileNumber = self.viewModel.mobile
            SessionManager.shared.user?.gender = self.viewModel.gender
            SessionManager.shared.user?.doB = self.viewModel.birthdate
            SessionManager.shared.user?.carAccess = self.viewModel.carAccess
            SessionManager.shared.user?.drivingLiscense = self.viewModel.drivingStatus
            SessionManager.shared.user?.emergencyContact?.name = self.viewModel.emergencyContactName
            SessionManager.shared.user?.emergencyContact?.phone = self.viewModel.emergencyContactPhone
            SessionManager.shared.user?.emergencyContact?.relation = self.viewModel.emergencyContactRelation
            self.profileView.setupProfileData()
            self.profileView.hideEditView(true)
        }, failure: { error in
            LoaderManager.hide(self.view)
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
            if textField == profileView.phoneNumberTextField {
                viewModel.phone = txtAfterUpdate
            }
            if textField == profileView.mobileNumberTextField {
                viewModel.mobile = txtAfterUpdate
            }
            if textField == profileView.emergencyContactNameTextField {
                viewModel.emergencyContactName = txtAfterUpdate
            }
            if textField == profileView.emergencyContactPhone {
                viewModel.emergencyContactPhone = txtAfterUpdate
            }
            if textField == profileView.emergencyContactRelation {
                viewModel.emergencyContactRelation = txtAfterUpdate
            }
        }
        return true
    }
}
