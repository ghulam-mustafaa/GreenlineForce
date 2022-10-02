//
//  ProfileView.swift
//  GreenLine
//
//  Created by EAPPLE on 10/09/2022.
//

import SDWebImage
import UIKit


class ProfileView: UIView {

    @IBOutlet weak var profileBGView: UIView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var profileLabel: UILabel!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var dateofBithLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var editProfileBGView: UIView!
    @IBOutlet weak var crossButton: UIButton!
    @IBOutlet weak var updateButton: UIButton!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var drivingLicenseSwitch: UISwitch!
    @IBOutlet weak var accessToCarSwitch: UISwitch!
    @IBOutlet weak var wspStaffButton: UIButton!
    @IBOutlet weak var qualificationLabel: UILabel!
    @IBOutlet weak var emergencyContactName: UILabel!
    @IBOutlet weak var mobileNumberTextField: UITextField!
    @IBOutlet weak var birthdayTextField: UITextField!
    @IBOutlet weak var genderTextField: UITextField!
    @IBOutlet weak var updateDrivingStatus: UISwitch!
    @IBOutlet weak var updateCarStatus: UISwitch!
    @IBOutlet weak var emergencyContactPhone: UITextField!
    @IBOutlet weak var emergencyContactNameTextField: UITextField!
    @IBOutlet weak var emergencyContactRelation: UITextField!
    @IBOutlet weak var birthdayPicker: UIDatePicker!
    
    override func awakeFromNib() {
        birthdayPicker.alpha = 0.1
    }
    
    func setupProfileData() {
        let user = SessionManager.shared.user
        nameLabel.text = "\(user?.firstName ?? "Greenline") \(user?.lastName ?? "User")"
        emailLabel.text = user?.email
        phoneLabel.text = user?.phoneNumber
        dateofBithLabel.text = user?.doB?.date?.birthdayString
        firstNameTextField.text = user?.firstName
        lastNameTextField.text = user?.lastName
        phoneNumberTextField.text = user?.phoneNumber
        genderLabel.text = user?.gender
        profileImageView.setBorderWidth(width: 1)
        profileImageView.setBorderColor(color: .textFieldBorderColor)
        profileImageView.sd_setImage(with: URL(string: user?.profilePicture ?? ""), placeholderImage: UIImage(named: "default_user_image"))
        drivingLicenseSwitch.isOn = user?.drivingLiscense ?? false
        accessToCarSwitch.isOn = user?.carAccess ?? false
        emergencyContactName.text = user?.emergencyContact?.name ?? "None"
        updateDrivingStatus.isOn = user?.drivingLiscense ?? false
        updateCarStatus.isOn = user?.carAccess ?? false
        mobileNumberTextField.text = user?.mobileNumber
        birthdayTextField.text = user?.doB?.date?.birthdayString
        genderTextField.text = user?.gender
        emergencyContactNameTextField.text = user?.emergencyContact?.name
        emergencyContactPhone.text = user?.emergencyContact?.phone
        emergencyContactRelation.text = user?.emergencyContact?.relation
    }
    
    func hideEditView(_ shouldHide: Bool) {
        editProfileBGView.isHidden = shouldHide
    }
}
