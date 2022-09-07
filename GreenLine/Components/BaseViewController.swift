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
        return .darkContent
    }
    override var overrideUserInterfaceStyle: UIUserInterfaceStyle {
        get {
            return .light
        }
        set {
            super.overrideUserInterfaceStyle = newValue
        }
    }

}
