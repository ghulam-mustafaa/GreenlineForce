//
//  AppDelegate.swift
//  GreenLine
//
//  Created by BrainX Technologies IOS 4 on 31/07/2022.
//

import IQKeyboardManagerSwift
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        setupKeyboardManager()
        setRootViewController()
        return true
    }
    
    // MARK: - Private Methods
    
    private func setRootViewController() {
        let navRootController = UINavigationController()
        navRootController.setNavigationBarHidden(true, animated: false)
        var viewController: UIViewController
        if UserDefaultsManager.accessToken.isNotEmpty && UserDefaultsManager.isRememberMeSelected {
            viewController = MainTabBarViewController.instantiate(from: .Main)
        } else {
            viewController = GetUserEmailViewController.instantiate(from: .Main)
        }
        navRootController.pushViewController(viewController, animated: true)
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navRootController
        window?.makeKeyAndVisible()
    }
    
    private func setupKeyboardManager() {
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.previousNextDisplayMode = .alwaysShow
        IQKeyboardManager.shared.toolbarPreviousNextAllowedClasses = [UIStackView.self, UIView.self]
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
    }
}

