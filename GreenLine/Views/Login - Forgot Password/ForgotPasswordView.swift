//
//  ForgotPasswordView.swift
//  GreenLine
//
//  Created by EAPPLE on 26/09/2022.
//

import UIKit

class ForgotPasswordView: UIView {

    @IBOutlet weak var passwordBGView: UIView!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var emailBGView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        emailBGView.setBorderColor(color: .textFieldBorderColor)
        emailBGView.setBorderWidth(width: 1)
        emailBGView.setCornerRadius(16)
        sendButton.setCornerRadius(16)
    }
}
