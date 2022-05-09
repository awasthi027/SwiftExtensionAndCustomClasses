//
//  NSError+Extention.swift
//  Awasthi027
//
//  Created by Ashish Awasthi on 20/11/21.
//

import Foundation
/// Generic extension for passing error object
extension Error {
    /// parse message from error object
    public var message: String {
        let item = self as NSError
        let userInfo = item.userInfo
        if let item = userInfo["message"] as? String {
            return item
        }
        return ""
    }
}
