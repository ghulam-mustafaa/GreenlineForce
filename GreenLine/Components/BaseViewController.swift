//
//  BaseViewController.swift
//  GreenLine
//
//  Created by EAPPLE on 02/09/2022.
//

import UIKit

class BaseViewController: UIViewController {

    // MARK: - Override Properties
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        if #available(iOS 13.0, *) {
            return .darkContent
        } else {
            return .default
        }
    }
    override var overrideUserInterfaceStyle: UIUserInterfaceStyle {
        get {
            return .light
        }
        set {
            if #available(iOS 13.0, *) {
                super.overrideUserInterfaceStyle = newValue
            } else {
                // Fallback on earlier versions
            }
        }
    }

}
