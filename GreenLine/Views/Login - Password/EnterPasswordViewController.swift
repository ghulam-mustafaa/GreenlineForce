//
//  EnterPasswordViewController.swift
//  GreenLine
//
//  Created by BrainX Technologies IOS 4 on 03/08/2022.
//

import UIKit

class EnterPasswordViewController: BaseViewController {

    @IBOutlet var loginView: EnterPasswordView!
    
    private var isPasswordShown = false
    private var isRememberMeSelected = false
    var viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction
    func rememberMeButtonAction(_ sender: UIButton) {
        isRememberMeSelected = !isRememberMeSelected
        loginView.selectRememberMeOption(isRememberMeSelected)
        UserDefaultsManager.isRememberMeSelected = isRememberMeSelected
    }
    
    @IBAction
    func showPasswordButtonAction(_ sender: UIButton) {
        isPasswordShown = !isPasswordShown
        loginView.showPassword(isPasswordShown)
    }
    
    @IBAction
    func forgotPasswordButtonAction(_ sender: UIButton) {
        // TODO: Will Implement in next branch
    }
    
    @IBAction
    func loginButtonAction(_ sender: UIButton) {
        let password = loginView.passwordTextField.text ?? ""
        viewModel.password = password
        let validationState = viewModel.validateInput()
        switch validationState {
            case .valid:
                viewModel.loginUser(success: {
                    if let appdelegate = UIApplication.shared.delegate as? AppDelegate {
                        let vc = MainTabBarViewController.instantiate(from: .Main)
                        appdelegate.window?.rootViewController = vc
                    }
                }, failure: { error in
                    Utils.showErrorDialog(withError: error, controller: self)
                })
            case .invalid(let message):
                Utils.showErrorDialog(withError: GreenlineError(message: message), controller: self)
        }
    }
}
