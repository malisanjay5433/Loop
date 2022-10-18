//
//  File.swift
//  Loop
//
//  Created by Sanjay Mali on 18/10/22.
//

import Foundation
import UIKit
extension UIColor {
    
    /// color with hax string
    ///
    /// - Parameter hexString: hexString description
    convenience init(hexString:String) {
        var hexString:String = hexString.trimmingCharacters(in: CharacterSet.whitespaces)
        
        if (hexString.hasPrefix("#")) { hexString.remove(at: hexString.startIndex) }
        
        var color:UInt64 = 0
        Scanner(string: hexString).scanHexInt64(&color)
        
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        
        self.init(displayP3Red: red, green: green, blue: blue, alpha: 1)
        //self.init(red:red, green:green, blue:blue, alpha:1)
    }
    /// color with hex string and alpha
    ///
    /// - Parameter hexString: hexString description
    /// - Parameter alpha: alpha description
    convenience init(hexString:String,alpha:Double) {
        var hexString:String = hexString.trimmingCharacters(in: CharacterSet.whitespaces)
        
        if (hexString.hasPrefix("#")) { hexString.remove(at: hexString.startIndex) }
        
        var color:UInt64 = 0
        Scanner(string: hexString).scanHexInt64(&color)
        
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        
        self.init(displayP3Red: red, green: green, blue: blue, alpha: min(alpha, 1))
        //self.init(red:red, green:green, blue:blue, alpha:1)
    }
        
    static let loopBackgroundColor = UIColor(hexString:"#141C25")
    static let loopElevatedColor = UIColor(hexString:"#243241")
    static let loopHighEmphasis = UIColor(hexString:"#141C25")
    static let loopSelectedStarGold = UIColor(hexString:"#FD9E02")
    static let loopVerylowEmphasis = UIColor(hexString:"#FFFFFF")

}
