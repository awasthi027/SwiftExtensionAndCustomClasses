//
//  String+Extension.swift
//  AioGames
//
//  Created by Tanuja Awasthi on 11/1/21.
//

import Foundation
import UIKit

extension String {
    
    /// convert string in http url
    public var asUrl: URL {
        guard let url = URL(string: self) else {
            debugPrint("Incorrect URL format, Please correct it")
            return URL.init(fileURLWithPath: "")
        }
        return url
    }
    /// localized string
   public func localized(_ comment: String? = nil) -> String {
        return NSLocalizedString(self, comment: comment ?? "")
    }
    /// Concate two in two lines with space and deferent fonts
    public func concatTwoStrings(_ second: String, _ lines: CGFloat = 0, _ alignment: NSTextAlignment = .center, _ fFont: UIFont = UIFont.roboRegular(14.0), _ sFont: UIFont = UIFont.roboBold(14.0)) ->NSAttributedString {
        let attiStr = NSMutableAttributedString(string: self + "\n" + second)
        // *** Create instance of `NSMutableParagraphStyle`
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = alignment
        // *** set LineSpacing property in points ***
        paragraphStyle.lineSpacing = lines // Whatever line spacing you want in points
        // *** Apply attribute to string ***
        attiStr.addAttribute(.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attiStr.length))
        attiStr.addAttribute(.font, value: fFont, range: NSRange(location: 0, length: self.count))
        attiStr.addAttribute(.font, value: sFont, range: NSRange(location:  self.count, length: second.count + 1))
        return attiStr
    }
    // show image with text left and right and center
    public func leftImageWithTxt(_ img: UIImage, _ endTxt: String = "", _ color: UIColor = UIColor.lightGray) ->NSAttributedString {
        // create an NSMutableAttributedString that we'll append everything to
        let fullStr = NSMutableAttributedString(string: self)
        // create our NSTextAttachment
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = img
        // wrap the attachment in its own attributed string so we can append it
        let attactment = NSAttributedString(attachment: imageAttachment)
        
        // add the NSTextAttachment wrapper to our full string, then add some more text.
        fullStr.append(attactment)
        fullStr.append(NSAttributedString(string: endTxt))
        fullStr.addAttribute(.foregroundColor, value: color, range: NSRange(location: 0, length: endTxt.count + 1))
        return fullStr
    }
}

//MARK: Validate strings
extension String {
    var isEmailValid: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
    var isPhoneNumberValid: Bool {
        let PHONE_REGEX = "(\\+)?[0-9]{1,3}?\\-?[0-9]{6,14}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result =  phoneTest.evaluate(with: self)
        return result
    }
    var isValidIFSCCode: Bool {
        let PHONE_REGEX = "^[A-Z]{4}0[A-Z0-9]{6}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result =  phoneTest.evaluate(with: self)
        return result
    }
    var isValidBankAccount: Bool {
        let PHONE_REGEX = "[0-9]{9,18}"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result =  phoneTest.evaluate(with: self)
        return result
    }
    var isValidAadhar: Bool {
        let PHONE_REGEX = "/[01]\\d{3}\\d{4}\\d{4}/"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result =  phoneTest.evaluate(with: self)
        return result
    }
    var isValidPAN: Bool {
        let PHONE_REGEX = "A-Z]{5}[0-9]{4}[A-Z]{1}"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result =  phoneTest.evaluate(with: self)
        return result
    }
    var masked: String {
        if self.isEmpty {
            return self
        }
        return String(repeating: "X", count: Swift.max(0, count - 4)) + suffix(4)
    }
}

//MARK: Find sub strings
extension String {
    public func index(from: Int) -> Index {
        return self.index(startIndex, offsetBy: from)
    }
    public func subString(from: Int) -> String {
        let fromIndex = index(from: from)
        return String(self[fromIndex...])
    }
    public func subString(to: Int) -> String {
        let toIndex = index(from: to)
        return String(self[..<toIndex])
    }
    public func subString(with r: Range<Int>) -> String {
        let startIndex = index(from: r.lowerBound)
        let endIndex = index(from: r.upperBound)
        return String(self[startIndex..<endIndex])
    }
}
/// Convert String to dict
extension String {
    /// convert string in dict
    var asDict: [String : Any]? {
        guard let data = self.data(using: .utf8) else { return nil }
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
    }
    /// convert string to dict and get value by passing the key
    func valueFor(_ key: String) -> String {
        guard let dict = self.asDict, let item = dict[key] as? String else { return ""}
        return item
    }
}

//MARK: Get Image
extension String {
    public var image: UIImage {
        guard let img = UIImage.init(named: self) else { return UIImage ()}
        return img
    }
}

// MARK: Alert Strings
extension String {
   public var capitalizingFirstLetter: String {
        return prefix(1).capitalized + dropFirst()
    }
}

//MARK: Load files from bundles
extension String {
    
    public func loadJSONFromBundle<T: Decodable>(_ dataType: T.Type) ->T? {
        if let url = Bundle.main.url(forResource: self, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let model = try decoder.decode(dataType.self, from: data)
                return model
            } catch {
                print("error:\(error)")
            }
        }
        return nil
    }
}
