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
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    func setupProfileData() {
        let user = SessionManager.shared.user
        nameLabel.text = "\(user?.firstName ?? "Greenline") \(user?.lastName ?? "User")"
        emailLabel.text = user?.email
        phoneLabel.text = user?.phone
        dateofBithLabel.text = user?.createdOn?.date?.formatDate(toFormat: "dd MMM yyyy")
        firstNameTextField.text = user?.firstName
        lastNameTextField.text = user?.lastName
        phoneNumberTextField.text = user?.phone
        passwordTextField.text = user?.password
        profileImageView.setBorderWidth(width: 1)
        profileImageView.setBorderColor(color: .textFieldBorderColor)
        profileImageView.sd_setImage(with: URL(string: user?.profilePicture ?? ""), placeholderImage: UIImage(named: "default_user_image"))
    }
    
    func hideEditView(_ shouldHide: Bool) {
        editProfileBGView.isHidden = shouldHide
    }
}
