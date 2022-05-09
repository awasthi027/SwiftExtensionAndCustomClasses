//
//  UIView+Extension.swift
//  Awasthi027
//
//  Created by Ashish Awasthi on 20/11/21.
//

import Foundation
import UIKit

extension UIView {
    /// load view from nib
    class func fromNib<T: UIView>() -> T {
        return Bundle(for: T.self).loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
    /// make corners rounds as per the radius, default radius = 0
    func cardLayer(_ radius: CGFloat = 0, _ borderWidth: CGFloat = 0, _ color: UIColor = .lightGray) {
        self.clipsToBounds = true
        self.layer.cornerRadius = radius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = color.cgColor
    }
    func cardBorderLayer(radius: CGFloat = 0, borderWidth: CGFloat = 0, color: UIColor) {
        self.clipsToBounds = true
        self.layer.cornerRadius = radius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = color.cgColor
       }
    
    func cardViewShadow(_ redius: CGFloat = 0.0, _ corners: UIRectCorner = .allCorners)  {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: redius, height: redius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
       layer.masksToBounds = false
       layer.shadowColor = color.cgColor
       layer.shadowOpacity = opacity
       layer.shadowOffset = offSet
       layer.shadowRadius = radius

       layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
       layer.shouldRasterize = true
       layer.rasterizationScale = scale ? UIScreen.main.scale : 1
     }
    
    func dropShadow(scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOpacity = 0.4
        layer.shadowOffset = .zero
        layer.shadowRadius = 3
        layer.cornerRadius = 5
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
}
