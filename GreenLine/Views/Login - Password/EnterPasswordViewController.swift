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
    var splashViewModel = SplashViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    private func getUserProfile() {
        LoaderManager.show(view)
        splashViewModel.getUserProfile(success: {
            LoaderManager.hide(self.view)
            if let appdelegate = UIApplication.shared.delegate as? AppDelegate {
                let navRootController = UINavigationController()
                navRootController.setNavigationBarHidden(true, animated: false)
                let viewController = MainTabBarViewController.instantiate(from: .Main)
                navRootController.pushViewController(viewController, animated: true)
                appdelegate.window = UIWindow(frame: UIScreen.main.bounds)
                appdelegate.window?.rootViewController = navRootController
                appdelegate.window?.makeKeyAndVisible()
            }
        }, failure: { error in
            LoaderManager.hide(self.view)
            SessionManager.shared.logout()
            Utils.showErrorDialog(withError: error, controller: self)
        })
    }
    
    @IBAction
    func backButtonAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
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
        let vc = ForgotPasswordViewController.instantiate(from: .Main)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction
    func loginButtonAction(_ sender: UIButton) {
        let password = loginView.passwordTextField.text ?? ""
        viewModel.password = password
        let validationState = viewModel.validateInput()
        switch validationState {
            case .valid:
                LoaderManager.show(view)
                viewModel.loginUser(success: {
                    LoaderManager.hide(self.view)
                    self.getUserProfile()
                }, failure: { error in
                    LoaderManager.hide(self.view)
                    Utils.showErrorDialog(withError: error, controller: self)
                })
            case .invalid(let message):
                Utils.showErrorDialog(withError: GreenlineError(message: message), controller: self)
        }
    }
}
