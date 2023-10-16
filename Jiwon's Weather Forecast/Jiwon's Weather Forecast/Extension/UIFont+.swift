//
//  Font.swift
//  Jiwon's Weather Forecast
//
//  Created by 신지원 on 2023/10/17.
//

import UIKit

//MARK: - Custom Font

extension UIFont{
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
