//
//  Font+Extension.swift
//  Awasthi027
//
//  Created by Ashish Awasthi on 07/12/21.
//

import UIKit

/*
 App Fonts
 */
extension UIFont {
    
    fileprivate static let robotoMedium = "Roboto-Medium"
    fileprivate static let robotoRegular = "Roboto-Regular"
    fileprivate static let robotoBold = "Roboto-Bold"
    fileprivate static let roboLight = "Roboto-Light"
    
    fileprivate static let montserratBold = "Montserrat-Bold"
    fileprivate static let montserratMedium = "Montserrat-Medium"
    fileprivate static let montserratSemiBold = "Montserrat-SemiBold"
    
    static func roboMedium(_ size: CGFloat) -> UIFont {
        return UIFont(name: UIFont.robotoMedium, size: size) ?? UIFont.systemFont(ofSize: size)
    }
    static func roboBold(_ size: CGFloat) -> UIFont {
        return UIFont(name: UIFont.robotoBold, size: size)  ?? UIFont.boldSystemFont(ofSize: size)
    }
    static func roboRegular(_ size: CGFloat) -> UIFont {
        return UIFont(name: UIFont.robotoRegular, size: size) ?? UIFont.systemFont(ofSize: size)
    }
    static func roboLight(_ size: CGFloat) -> UIFont {
        return UIFont(name: UIFont.roboLight, size: size) ?? UIFont.systemFont(ofSize: size)
    }
    static func montSemiBold(_ size: CGFloat) -> UIFont {
        return UIFont(name: UIFont.montserratSemiBold, size: size) ?? UIFont.boldSystemFont(ofSize: size)
    }
    static func montBold(_ size: CGFloat) -> UIFont {
        return UIFont(name: UIFont.montserratBold, size: size) ?? UIFont.systemFont(ofSize: size)
    }
    static func montMedium(_ size: CGFloat) -> UIFont {
        return UIFont(name: UIFont.montserratMedium, size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
}
