//
//  File.swift
//  Jiwon's Weather Forecast
//
//  Created by 신지원 on 2023/10/17.
//

import UIKit

import SnapKit
import Then

class WeatherBaseButton: UIButton {
    
    // MARK: - Properties
    
    // MARK: - UI Components
    var placeLabel = UILabel()
    var timeLabel = UILabel()
    var weatherLabel = UILabel()
    var currentTemLabel = UILabel()
    var highTemLabel = UILabel()
    var lowTemLabel = UILabel()
    
    
    // MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setStyle()
        setHierarchy()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setStyle() {
        self.setBackgroundImage(Image.weatherSmall, for: .normal)
        placeLabel.do {
            $0.font = .SFPro(.bold, size: 24)
            $0.textColor = .white
        }
        
        timeLabel.do {
            $0.font = .SFPro(.regular, size: 17)
            $0.textColor = .white
        }
        
        weatherLabel.do {
            $0.font = .SFPro(.regular, size: 16)
            $0.textColor = .white
        }
        
        currentTemLabel.do {
            $0.font = .SFPro(.regular, size: 52)
            $0.textColor = .white
        }
        highTemLabel.do {
            $0.font = .SFPro(.regular, size: 15)
            $0.textColor = .white
        }
        
        lowTemLabel.do {
            $0.font = .SFPro(.regular, size: 15)
            $0.textColor = .white
        }
    }
    
    func setHierarchy() {
        self.addSubviews(placeLabel, timeLabel, weatherLabel, currentTemLabel, lowTemLabel, highTemLabel)
    }
    
    func setLayout() {
        placeLabel.snp.makeConstraints() {
            $0.top.equalToSuperview().inset(10)
            $0.leading.equalToSuperview().inset(16)
        }
        
        timeLabel.snp.makeConstraints() {
            $0.top.equalTo(placeLabel.snp.bottom).offset(2)
            $0.leading.equalTo(placeLabel.snp.leading)
            
        }
        
        weatherLabel.snp.makeConstraints() {
            $0.bottom.equalToSuperview().inset(10)
            $0.leading.equalTo(placeLabel.snp.leading)
        }
        
        currentTemLabel.snp.makeConstraints() {
            $0.top.equalToSuperview().inset(4)
            $0.trailing.equalToSuperview().inset(16)
        }
        
        lowTemLabel.snp.makeConstraints() {
            $0.bottom.equalToSuperview().inset(10)
            $0.trailing.equalToSuperview().inset(16)
        }
        
        highTemLabel.snp.makeConstraints() {
            $0.bottom.equalToSuperview().inset(10)
            $0.trailing.equalTo(lowTemLabel.snp.leading).offset(-6)
        }
    }
}

