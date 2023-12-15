//
//  File.swift
//  Weather_App
//
//  Created by 신지원 on 12/11/23.
//

import UIKit

//MARK: - Custom Font

extension UIFont {
    public enum SFProType: String {
        case bold = "Bold"
        case medium = "Medium"
        case light = "Light"
        case regular = "Regular"
        case thin = "Thin"
    }
    
    static func SFPro(_ type: SFProType, size: CGFloat) -> UIFont {
        return UIFont(name: "SFProDisplay-\(type.rawValue)", size: size) ?? UIFont(name: "systemFont", size: 0)!
    }
}

extension UIView {
    
    func addSubviews(_ views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }
}

extension UIColor {
    
    convenience init(hex: UInt, alpha: CGFloat = 1.0) {
        self.init(
            red: CGFloat((hex & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((hex & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(hex & 0x0000FF) / 255.0,
            alpha: CGFloat(alpha)
        )
    }
}

