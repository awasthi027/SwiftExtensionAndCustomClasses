//
//  Bundle+Extension.swift
//  Awasthi027
//
//  Created by Ashish Awasthi on 18/03/22.
//

import UIKit
import Foundation

extension Bundle {
    /// get appllication bundle name
    public var appName: String {
        guard let item = object(forInfoDictionaryKey: "CFBundleName") as? String else { return ""}
        return item
    }
    /// get application version
    public var appVersion: String {
        guard let item = object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String else { return ""}
        return item
    }
    /// get applictaion build number
    var buildNumber: String {
        guard let item = object(forInfoDictionaryKey: "CFBundleVersion") as? String else { return ""}
        return item
    }
}
