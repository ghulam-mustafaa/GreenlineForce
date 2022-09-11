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
    @IBOutlet weak var editImageView: UIImageView!
    @IBOutlet weak var editNameTextField: UITextField!
    @IBOutlet weak var editEmailTextField: UITextField!
    @IBOutlet weak var editPhoneTextField: UITextField!
    @IBOutlet weak var maleRadioIcon: UIImageView!
    @IBOutlet weak var femaleRadioIcon: UIImageView!
    @IBOutlet weak var undisclosedRadioIcon: UIImageView!
    @IBOutlet weak var updateButton: UIButton!
    
    func setupProfileData() {
        let user = SessionManager.shared.user
        nameLabel.text = user?.name
        emailLabel.text = user?.email
        phoneLabel.text = user?.phone
        dateofBithLabel.text = user?.createdOn
        editNameTextField.text = user?.name
        editEmailTextField.text = user?.email
        editPhoneTextField.text = user?.phone
        profileImageView.setBorderWidth(width: 1)
        profileImageView.setBorderColor(color: .textFieldBorderColor)
        editImageView.setBorderWidth(width: 1)
        editImageView.setBorderColor(color: .textFieldBorderColor)
        profileImageView.sd_setImage(with: URL(string: user?.profilePicture ?? ""), placeholderImage: UIImage(named: "default_user_image"))
        editImageView.sd_setImage(with: URL(string: user?.profilePicture ?? ""), placeholderImage: UIImage(named: "default_user_image"))
    }
    
    func hideEditView(_ shouldHide: Bool) {
        editProfileBGView.isHidden = shouldHide
    }
}
