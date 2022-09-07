//
//  UIView.swift
//  GreenLine
//
//  Created by BrainX Technologies IOS 4 on 31/07/2022.
//

import UIKit

extension UIView {

    var width: CGFloat {
        get {
            return self.frame.size.width
        }
        set {
            self.frame.size.width = newValue
        }
    }
    
    var height: CGFloat {
        get {
            return self.frame.size.height
        }
        set {
            self.frame.size.height = newValue
        }
    }
    
    var size: CGSize  {
        get {
            return self.frame.size
        }
        set{
            self.frame.size = newValue
        }
    }
    
    var origin: CGPoint {
        get {
            return self.frame.origin
        }
        set {
            self.frame.origin = newValue
        }
    }
    
    var x: CGFloat {
        get {
            return self.frame.origin.x
        }
        set {
            self.frame.origin = CGPoint(x:newValue, y:self.frame.origin.y)
        }
    }
    
    var y: CGFloat {
        get {
            return self.frame.origin.y
        }
        set {
            self.frame.origin = CGPoint(x:self.frame.origin.x, y:newValue)
        }
    }
    
    var centerX: CGFloat {
        get {
            return self.center.x
        }
        set {
            self.center = CGPoint(x:newValue, y:self.center.y)
        }
    }
    
    var centerY: CGFloat {
        get {
            return self.center.y
        }
        set {
            self.center = CGPoint(x:self.center.x, y:newValue)
        }
    }
    
    var left: CGFloat {
        get {
            return self.frame.origin.x
        }
        set {
            self.frame.origin.x = newValue
        }
    }
    
    var right: CGFloat {
        get {
            return self.frame.origin.x + self.frame.size.width
        }
        set {
            self.frame.origin.x = newValue - self.frame.size.width
        }
    }
    var top: CGFloat {
        get {
            return self.frame.origin.y
        }
        set {
            self.frame.origin.y = newValue
        }
    }
    var bottom: CGFloat {
        get {
            return self.frame.origin.y + self.frame.size.height
        }
        set {
            self.frame.origin.y = newValue - self.frame.size.height
        }
    }
    
    func setCornerRadius(_ r : CGFloat, andClipContent clip: Bool = false) {
        layer.cornerRadius = r
        layer.masksToBounds = clip
    }
    
    func addDashedBorder(strokeColor: UIColor, lineWidth: CGFloat) {
        self.layoutIfNeeded()
        let strokeColor = strokeColor.cgColor

        let shapeLayer:CAShapeLayer = CAShapeLayer()
        let frameSize = self.frame.size
        let shapeRect = CGRect(x: 0, y: 0, width: frameSize.width, height: frameSize.height)

        shapeLayer.bounds = shapeRect
        shapeLayer.position = CGPoint(x: frameSize.width/2, y: frameSize.height/2)
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = strokeColor
        shapeLayer.lineWidth = lineWidth
        shapeLayer.lineJoin = CAShapeLayerLineJoin.round

        shapeLayer.lineDashPattern = [5,5] // adjust to your liking
        shapeLayer.path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: shapeRect.width, height: shapeRect.height), cornerRadius: self.layer.cornerRadius).cgPath
    }
    
    func rotate360Degrees(duration: CFTimeInterval = 0.3, completionDelegate: AnyObject? = nil) {
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnimation.fromValue = -CGFloat(Double.pi/2)
        rotateAnimation.toValue = 0
        rotateAnimation.duration = duration
        rotateAnimation.repeatCount = Float.infinity
        self.layer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.layer.add(rotateAnimation, forKey: nil)
    }
    
    func increaseSize() {
        let animation = CABasicAnimation(keyPath: "transform.scale")
        animation.toValue = 1
        animation.fromValue = 0
        animation.duration = 0.3
        animation.autoreverses = false
        self.layer.add(animation, forKey: nil)
    }

    func resumeLayer() {
        let pausedTime: CFTimeInterval = layer.timeOffset
        layer.speed = 1.0
        layer.timeOffset = 0.0
        layer.beginTime = 0.0
        let timeSincePause: CFTimeInterval = layer.convertTime(CACurrentMediaTime(), from: nil) - pausedTime
        layer.beginTime = timeSincePause
    }

    func pauseLayer() {
        let pausedTime : CFTimeInterval = layer.convertTime(CACurrentMediaTime(), from: nil)
        layer.speed = 0.0
        layer.timeOffset = pausedTime
    }

    @IBInspectable var shadow: Bool {
        get {
            return layer.shadowOpacity > 0.0
        }
        set {
            if newValue == true {
                self.addShadow()
            }
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
            
            // Don't touch the masksToBound property if a shadow is needed in addition to the cornerRadius
            if shadow == false {
                self.layer.masksToBounds = true
            }
        }
    }
    
    func addShadow(shadowColor: CGColor = UIColor.black.cgColor,
                   shadowOffset: CGSize = CGSize(width: 1.0, height: 2.0),
                   shadowOpacity: Float = 0.4,
                   shadowRadius: CGFloat = 3.0) {
        layer.shadowColor = shadowColor
        layer.shadowOffset = shadowOffset
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = shadowRadius
    }
    
    func setBorderColor(color: UIColor){
        self.layer.borderColor = color.cgColor
    }
    
    func setBorderWidth(width: CGFloat){
        self.layer.borderWidth = width
    }
    
    func setCornerRadius(r : CGFloat){
        self.layer.cornerRadius = r
    }
    
    func makeRoundCorners(cornerRadius: CGFloat, maskedCorners: CACornerMask = [.layerMinXMinYCorner,
                                                             .layerMaxXMinYCorner,
                                                             .layerMinXMaxYCorner,
                                                             .layerMaxXMaxYCorner]){
            clipsToBounds = true
            layer.cornerRadius = cornerRadius
            layer.maskedCorners = maskedCorners
        }
    
    func setCornerRadius(_  r : CGFloat, forCorners corners: CACornerMask){
        self.layer.cornerRadius = r
        self.layer.maskedCorners = corners
    }
    
    // shot
    func snapshot() -> UIImage {
        let size = self.frame.size
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        
        UIGraphicsBeginImageContext(size)
        drawHierarchy(in: rect, afterScreenUpdates: true)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
    @discardableResult
    func loadFromNib<T: UIView>() -> T? {
        let bundle = Bundle(for: type(of: self))
        let loadedView = bundle.loadNibNamed(String(describing: type(of: self)),
                                             owner: self,
                                             options: nil)?.first
        guard let contentView = loadedView as? T else {
            return nil
        }
        return contentView
    }
    
    func fixInView(_ container: UIView) {
        frame = container.bounds
        container.addSubview(self)
        addEqualConstraintsWith(container)
    }
    
    func addEqualConstraintsWith(_ view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        [NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1.0, constant: 0),
         NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1.0, constant: 0),
         NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1.0, constant: 0),
         NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: 0)].forEach { $0.isActive = true }
    }
    
    func addTapToDismiss() {
        let tapViewGesture = UITapGestureRecognizer(target: self, action: #selector(dismiss))
        tapViewGesture.cancelsTouchesInView = false
        addGestureRecognizer(tapViewGesture)
    }
    
    @objc func dismiss() {
        endEditing(true)
    }
}
