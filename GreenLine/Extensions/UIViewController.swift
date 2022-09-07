//
//  UIViewController.swift
//  GreenLine
//
//  Created by BrainX Technologies IOS 4 on 31/07/2022.
//

import UIKit


extension UIViewController {
    func isRootViewController() -> Bool {
        if let array = self.navigationController?.viewControllers {
            if array.count>0 {
                return array[0] == self
            }
        }
        return false
    }
    
    static var storyboardId: String {
        return String(describing: self)
    }
    
    static func instantiate(from storyboardName: UIStoryboard.Name) -> Self {
            let storyboard = UIStoryboard(name: storyboardName.rawValue, bundle: nil)
            return storyboard.instantiateViewController(withIdentifier: storyboardId) as! Self
    }
}

extension UINavigationController {
    func popViewControllerWithHandler(completion: @escaping ()->()) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        self.popViewController(animated: true)
        CATransaction.commit()
    }
    func pushViewController(viewController: UIViewController, completion: @escaping ()->()) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        self.pushViewController(viewController, animated: true)
        CATransaction.commit()
    }
}

extension UIFont {
    static func boldMontserrat(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "Montserrat-Bold", size: size)!
    }
    static func semiBoldMontserrat(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "Montserrat-SemiBold", size: size)!
    }
    static func mediumMontserrat(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "Montserrat-Medium", size: size)!
    }
    static func regularMontserrat(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "Montserrat-Regular", size: size)!
    }
}
