//
//  GetUserEmailView.swift
//  GreenLine
//
//  Created by BrainX Technologies IOS 4 on 31/07/2022.
//

import UIKit

class GetUserEmailView: UIView {
    
    @IBOutlet weak var loginBGView: UIView!
    @IBOutlet weak var emailBGView: UIView!
    @IBOutlet weak var emailAddressTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        emailBGView.setBorderColor(color: .textFieldBorderColor)
        emailBGView.setBorderWidth(width: 1)
        emailBGView.setCornerRadius(16)
        nextButton.setCornerRadius(16)
    }
}
