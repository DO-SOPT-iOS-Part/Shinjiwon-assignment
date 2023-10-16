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
    var myPlaceLabel = UILabel()
    var placeLabel = UILabel()
    var weatherLabel = UILabel()
    var tempLabel = UILabel()
    var highestTempLabel = UILabel()
    var lowestTempLabel = UILabel()
    
    
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
        myPlaceLabel.do {
            $0.text = "나의 위치"
            $0.font = .SFPro(.bold, size: 24)
            $0.textColor = .white
        }
        
        placeLabel.do {
            $0.text = "공주"
            $0.font = .SFPro(.regular, size: 17)
            $0.textColor = .white
        }
        weatherLabel.do {
            $0.text = "공주"
            $0.font = .SFPro(.regular, size: 16)
            $0.textColor = .white
        }
        
        tempLabel.do {
            $0.text = "21°"
            $0.font = .SFPro(.regular, size: 52)
            $0.textColor = .white
        }
        highestTempLabel.do {
            $0.text = "최고:22°"
            $0.font = .SFPro(.regular, size: 15)
            $0.textColor = .white
        }
        
        lowestTempLabel.do {
            $0.text = "최저:10°"
            $0.font = .SFPro(.regular, size: 15)
            $0.textColor = .white
        }
    }
    
    func setHierarchy() {
        self.addSubviews(myPlaceLabel, placeLabel, weatherLabel, tempLabel, lowestTempLabel, highestTempLabel)
    }
    
    func setLayout() {
        myPlaceLabel.snp.makeConstraints() {
            $0.top.equalToSuperview().inset(10)
            $0.leading.equalToSuperview().inset(16)
        }
        
        placeLabel.snp.makeConstraints() {
            $0.top.equalTo(myPlaceLabel.snp.bottom).offset(2)
            $0.leading.equalTo(myPlaceLabel.snp.leading)
            
        }
        weatherLabel.snp.makeConstraints() {
            $0.bottom.equalToSuperview().inset(10)
            $0.leading.equalTo(myPlaceLabel.snp.leading)
        }
        
        tempLabel.snp.makeConstraints() {
            $0.top.equalToSuperview().inset(4)
            $0.trailing.equalToSuperview().inset(16)
        }
        
        lowestTempLabel.snp.makeConstraints() {
            $0.bottom.equalToSuperview().inset(10)
            $0.trailing.equalToSuperview().inset(16)
        }
        
        highestTempLabel.snp.makeConstraints() {
            $0.bottom.equalToSuperview().inset(10)
            $0.trailing.equalTo(lowestTempLabel.snp.leading).offset(-6)
        }
    }
}

