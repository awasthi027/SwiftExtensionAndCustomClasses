//
//  MandatoryLabel.swift
//  Awasthi027
//
//  Created by Ashish Awasthi on 20/04/22.
//


import UIKit
/// Display star red text on mandatory label field.
@IBDesignable class MandatoryLabel: UILabel {

    @IBInspectable var fontSize: CGFloat = 13.0

    @IBInspectable var fontFamily: String = "DIN Light"
    
    override func awakeFromNib() {
        let star = "*"
        if let item = self.text {
            let attiStr = NSMutableAttributedString(string: item + star)
            attiStr.addAttribute(.foregroundColor, value: UIColor.red, range: NSRange(location: item.count, length: star.count))
            self.attributedText = attiStr
        }
    }
}
