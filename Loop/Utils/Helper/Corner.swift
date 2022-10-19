//
//  Corner.swift
//  Loop
//
//  Created by Sanjay Mali on 19/10/22.
//

import Foundation
import UIKit

final class Corner: UIView {
    private var shadowLayer: CAShapeLayer!
    override func layoutSubviews() {
        super.layoutSubviews()

        if shadowLayer == nil {
            shadowLayer = CAShapeLayer()
            shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: 12).cgPath
            shadowLayer.fillColor = UIColor.white.cgColor

            shadowLayer.shadowColor = UIColor.darkGray.cgColor
            shadowLayer.shadowPath = shadowLayer.path
            shadowLayer.shadowOffset = CGSize(width: 1.5, height: 1.5)
            shadowLayer.shadowOpacity = 0.8
            shadowLayer.shadowRadius = 2

            layer.insertSublayer(shadowLayer, at: 0)
            //layer.insertSublayer(shadowLayer, below: nil) // also works
        }
    }

}
class CornerRadius: UIView {
    override func awakeFromNib() {
        self.layoutIfNeeded()
        layer.cornerRadius = 10
        layer.masksToBounds = true
    }
}
