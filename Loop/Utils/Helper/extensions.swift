//
//  File.swift
//  Loop
//
//  Created by Sanjay Mali on 19/10/22.
//

import Foundation
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
