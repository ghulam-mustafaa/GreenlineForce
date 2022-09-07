//
//  UIColor.swift
//  GreenLine
//
//  Created by BrainX Technologies IOS 4 on 31/07/2022.
//

import Foundation
import UIKit

extension UIColor {
    public convenience init(_ value: Int) {
        let components = getColorComponents(value: value)
        self.init(red: components.red, green: components.green, blue: components.blue, alpha: 1.0)
    }
    static let textColor = UIColor(0x20290E)
    static let textFieldBorderColor = UIColor(0x20290E).withAlphaComponent(0.16)
}
private func getColorComponents(value: Int) -> (red: CGFloat, green: CGFloat, blue: CGFloat) {
    let r = CGFloat(value >> 16 & 0xFF) / 255.0
    let g = CGFloat(value >> 8 & 0xFF) / 255.0
    let b = CGFloat(value & 0xFF) / 255.0
    
    return (r, g, b)
}
