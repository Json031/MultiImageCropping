//
//  MICLabelExtension.swift
//
//  Created by MorganChen on 2025/3/28.
//

import UIKit

extension UILabel {
    public func makeAttriText(string: String, shadowBlurRadius: CGFloat, shadowOffset: CGSize, shadowColor: UIColor) {
        let attrString: NSMutableAttributedString = NSMutableAttributedString(string: string)
        let shadow: NSShadow = NSShadow()
        shadow.shadowBlurRadius = shadowBlurRadius
        shadow.shadowOffset = shadowOffset
        shadow.shadowColor = shadowColor
        attrString.addAttributes([NSAttributedString.Key.shadow : shadow], range: NSRange(location:0, length:(self.text ?? "").count))
        self.attributedText = attrString
    }
}
