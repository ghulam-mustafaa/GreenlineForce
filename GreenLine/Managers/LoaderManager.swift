//
//  LoaderManager.swift
//  GreenLine
//
//  Created by EAPPLE on 11/09/2022.
//

import Foundation
import MBProgressHUD

class LoaderManager {
    public static func show(_ view: UIView, message: String? = nil) {
        let loader = MBProgressHUD.showAdded(to: view, animated: true)
        loader.mode = .indeterminate
        loader.bezelView.backgroundColor = .black
        loader.bezelView.blurEffectStyle = .dark
        if let message = message {
            loader.label.text = message
        }
        loader.contentColor = .white
    }
    
    public static func hide(_ view: UIView) {
        MBProgressHUD.hide(for: view, animated: true)
    }
}
