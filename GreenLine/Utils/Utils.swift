//
//  Utils.swift
//  GreenLine
//
//  Created by EAPPLE on 07/09/2022.
//

import UIKit
import SystemConfiguration
import UserNotifications

class Utils {
    static func showOkAlert(title: String, message: String, viewController: UIViewController) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(okAction)
        viewController.present(alertController, animated: true, completion: nil)
    }
    
    static func showActionAlert(title: String, message: String, viewController: UIViewController, alertActions: [UIAlertAction]) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for alertAction in alertActions {
            alertController.addAction(alertAction)
        }
        viewController.present(alertController, animated: true, completion: nil)
    }
    
    static func showErrorDialog(withError error: GreenlineError, controller: UIViewController) {
//        LoaderManager.hide(controller.view)
        let message = error.message ?? "Something went wrong"
        Utils.showOkAlert(title: "Error", message: message, viewController: controller)
    }
    
    static func showLoginScreen() -> GetUserEmailViewController {
        let window = UIApplication.shared.windows.first
        let viewController = GetUserEmailViewController.instantiate(from: .Main)
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.setNavigationBarHidden(true, animated: false)
        window?.rootViewController = navigationController
        return viewController
    }
}
