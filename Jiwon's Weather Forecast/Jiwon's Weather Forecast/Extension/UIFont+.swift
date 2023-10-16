//
//  Font.swift
//  Jiwon's Weather Forecast
//
//  Created by 신지원 on 2023/10/17.
//

import UIKit

//MARK: - Custom Font

extension UIFont{
    public enum SFProDisplayType: String {
        case bold = "Bold"
        case medium = "Medium"
        case light = "Light"
        case regular = "Regular"
        case thin = "Thin"
    }
    
    static func SFProDisplay(_ type: SFProDisplayType, size: CGFloat) -> UIFont {
        return UIFont(name: "SF-Pro-Display-\(type.rawValue)", size: size)!
    }
}
