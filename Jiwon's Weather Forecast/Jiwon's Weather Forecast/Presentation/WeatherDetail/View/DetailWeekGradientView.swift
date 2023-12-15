//
//  DetailWeekGradientView.swift
//  Jiwon's Weather Forecast
//
//  Created by 신지원 on 11/9/23.
//

import UIKit

class DetailWeekGradientView: UIView {
    
    private func applyGradient(colors: [CGColor]) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        gradientLayer.colors = colors
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        applyGradient(colors: [UIColor(hex: 0x96D0A8).cgColor, UIColor(hex: 0xB5CF79).cgColor, UIColor(hex: 0xF8D74A).cgColor, UIColor(hex: 0xEF8835).cgColor])
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if let gradientLayer = self.layer.sublayers?.first as? CAGradientLayer {
            gradientLayer.frame = self.bounds
        }
    }
}
