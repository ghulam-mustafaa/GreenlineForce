//
//  SplashViewController.swift
//  GreenLine
//
//  Created by EAPPLE on 11/09/2022.
//

import UIKit

class SplashViewController: BaseViewController {

    @IBOutlet var splashView: SplashView!
    
    let viewModel = SplashViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if UserDefaultsManager.accessToken.isNotEmpty && UserDefaultsManager.isRememberMeSelected {
           getUserProfile()
        } else {
            showLoginViewController()
        }
    }
    
    private func getUserProfile() {
        viewModel.getUserProfile(success: {
            self.showMainTabBarViewController()
        }, failure: {_ in
            self.getUserProfile()
        })
    }
    
    private func showLoginViewController() {
        if let appdelegate = UIApplication.shared.delegate as? AppDelegate {
            let navRootController = UINavigationController()
            navRootController.setNavigationBarHidden(true, animated: false)
            let viewController = GetUserEmailViewController.instantiate(from: .Main)
            navRootController.pushViewController(viewController, animated: true)
            appdelegate.window = UIWindow(frame: UIScreen.main.bounds)
            appdelegate.window?.rootViewController = navRootController
            appdelegate.window?.makeKeyAndVisible()
        }
    }
    
    private func showMainTabBarViewController() {
        if let appdelegate = UIApplication.shared.delegate as? AppDelegate {
            let navRootController = UINavigationController()
            navRootController.setNavigationBarHidden(true, animated: false)
            let viewController = MainTabBarViewController.instantiate(from: .Main)
            navRootController.pushViewController(viewController, animated: true)
            appdelegate.window = UIWindow(frame: UIScreen.main.bounds)
            appdelegate.window?.rootViewController = navRootController
            appdelegate.window?.makeKeyAndVisible()
        }
    }
}
