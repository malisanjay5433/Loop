//
//  File.swift
//  Loop
//
//  Created by Sanjay Mali on 19/10/22.
//

import Foundation
import UIKit
extension NSNumber {
    
    /// Converts an NSNumber into a formatted currency string, device's current Locale.
    var currency: String {
        return self.currency(for: Locale.current)
    }
    
    /// Converts an NSNumber into a formatted currency string, using Locale as a parameter.
    func currency(for locale: Locale) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.usesGroupingSeparator = locale.groupingSeparator != nil
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = locale
        
        return numberFormatter.string(from: self)!
    }
}
extension Double {
    
    /// Converts a Double into a formatted currency string, device's current Locale.
    var currency: String {
        return NSNumber(value: self).currency(for: Locale.current)
    }
    
    /// Converts a Double into a formatted currency string, using Locale as a parameter.
    func currency(for locale: Locale) -> String {
        return NSNumber(value: self).currency(for: locale)
    }
}

extension Float {
    
    /// Converts a Float into a formatted currency string, device's current Locale.
    var currency: String {
        return NSNumber(value: self).currency(for: Locale.current)
    }
    
    /// Converts a Float into a formatted currency string, using Locale as a parameter.
    func currency(for locale: Locale) -> String {
        return NSNumber(value: self).currency(for: locale)
    }
}

extension UIImageView{
    func loopshadow(radius: CGFloat){
        self.layer.shadowOffset = CGSize(width: 0, height:4)
        self.layer.shadowColor = UIColor.white.cgColor
        self.layer.shadowOpacity = 1.5
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
}
extension UIView{
    func loopdropshadow(radius: CGFloat){
        self.layer.shadowOffset = CGSize(width:1, height:4)
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOpacity = 1.5
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
}

//MARK: Use for textfield padding
class TextFieldWithPadding: UITextField {
    var textPadding = UIEdgeInsets(
        top: 10,
        left: 40,
        bottom: 10,
        right: 20
    )

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.textRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.editingRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }
}
