//
//  UIScreen+Extension.swift
//  Awasthi027
//
//  Created by Ashish Awasthi on 03/12/21.
//

import Foundation
import UIKit

extension UIScreen {
    /// width of phone
    public static var width: CGFloat {
        return UIScreen.main.bounds.width
    }
    /// height of phone
    public static var height: CGFloat {
        return UIScreen.main.bounds.height
    }
    /// size of phone
    public static var size: CGSize {
        return UIScreen.main.bounds.size
    }
}
