//
//  UIView+Extensions.swift
//  Test Technique Baha
//
//  Created by Bahaeddine Boulaabi on 06/12/2022.
//

import Foundation
import UIKit

extension UIView {
    func applyShadow(radius: CGFloat, color: UIColor, opacity: Float, shadowOffset: CGSize = CGSize(width: -1, height: -1)) {
        self.layer.shadowColor = color.cgColor
        self.layer.shadowRadius = radius
        self.layer.shadowOpacity = opacity
        self.clipsToBounds = false
        self.layer.shadowOffset = shadowOffset
    }
}
