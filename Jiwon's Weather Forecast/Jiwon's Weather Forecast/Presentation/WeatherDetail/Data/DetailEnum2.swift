//
//  DetailEnum2.swift
//  Jiwon's Weather Forecast
//
//  Created by 신지원 on 11/9/23.
//

import UIKit

struct Detail2 {
    let day : String
    let icon : Icon2
    let lowTem : Int
    let highTem : Int
}

@frozen
enum Icon2 {
    case lightning
    case moon
    case rain
    case rainsun
    case snow
    
    var image : UIImage {
        switch self {
        case .lightning:
            return Image.iconLightning
        case .moon:
            return Image.iconMoon
        case .rain:
            return Image.iconRain
        case .rainsun:
            return Image.iconRainSun
        case .snow:
            return Image.iconSnow
        }
    }
}

