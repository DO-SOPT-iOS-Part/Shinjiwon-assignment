//
//  UIColor+.swift
//  Jiwon's Weather Forecast
//
//  Created by 신지원 on 2023/10/16.
//

import UIKit

extension UIColor {
    
    static let tvingRed = UIColor(hex: 0xFF143C)
    static let tvingGray5 = UIColor(hex: 0x191919)
    static let tvingGray4 = UIColor(hex: 0x2E2E2E)
    static let tvingGray3 = UIColor(hex: 0x626262)
    static let tvingGray2 = UIColor(hex: 0x9C9C9C)
    static let tvingGray1 = UIColor(hex: 0xD6D6D6)
    
    convenience init(hex: UInt, alpha: CGFloat = 1.0) {
        self.init(
            red: CGFloat((hex & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((hex & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(hex & 0x0000FF) / 255.0,
            alpha: CGFloat(alpha)
        )
    }
}
