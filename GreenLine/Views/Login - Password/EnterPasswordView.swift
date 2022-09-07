//
//  EnterPasswordView.swift
//  GreenLine
//
//  Created by BrainX Technologies IOS 4 on 03/08/2022.
//

import UIKit

class EnterPasswordView: UIView {

    @IBOutlet weak var loginBGView: UIView!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var teamBGView: UIView!
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var teamWebsiteLabel: UILabel!
    @IBOutlet weak var passwordBGView: UIView!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var showPasswordButton: UIButton!
    @IBOutlet weak var rememberMeCheckBoxIcon: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        [passwordBGView, teamBGView].forEach({
            $0?.setBorderColor(color: .textFieldBorderColor)
            $0?.setBorderWidth(width: 1)
        })
        [loginButton, passwordBGView, teamBGView].forEach({
            $0?.setCornerRadius(16)
        })
    }
    
    func selectRememberMeOption(_ isSelected: Bool) {
        let image = isSelected ? UIImage(systemName: "checkmark.square.fill") : UIImage(named: "empty_check_box")
        rememberMeCheckBoxIcon.image = image
        rememberMeCheckBoxIcon.tintColor = .textColor
    }
    
    func showPassword(_ shouldShow: Bool) {
        passwordTextField.isSecureTextEntry = !shouldShow
        let image = shouldShow ? UIImage(systemName: "eye") : UIImage(named: "closed_eye")
        showPasswordButton.setImage(image, for: .normal)
        showPasswordButton.tintColor = .textColor
    }
}
