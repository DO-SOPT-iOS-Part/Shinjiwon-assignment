//
//  DetailEnum.swift
//  Jiwon's Weather Forecast
//
//  Created by 신지원 on 10/18/23.
//

import UIKit

struct Detail {
    let time : String
    let icon : Icon
    let tem : String
}

@frozen
enum Icon {
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
