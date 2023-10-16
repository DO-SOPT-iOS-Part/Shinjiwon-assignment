//
//  WeatherListScrollView.swift
//  Jiwon's Weather Forecast
//
//  Created by 신지원 on 2023/10/17.
//

import UIKit

class WeatherListScrollView: UIView {

    // MARK: - Properties
    
    // MARK: - UI Components
    var scrollView = UIScrollView()
    var scrollContentView = UIView()
    var scrollWeatherLabel = UILabel()
    var scrollWeatherSearchBar = UISearchBar()
    var scrollWeatherButton = WeatherBaseButton()
    var scrollBox = UIView()
    
    // MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        hierarchy()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Custom Method
    private func style() {
        
        scrollView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.isUserInteractionEnabled = true
            $0.isScrollEnabled = true
            $0.showsVerticalScrollIndicator = true
        }
        
        scrollWeatherLabel.do {
            $0.text = "날씨"
            $0.font = .SFPro(.bold, size: 36)
            $0.textColor = .white
        }
        
        scrollWeatherSearchBar.do {
            $0.showsCancelButton = false
            $0.backgroundColor = .black
            $0.searchTextField.backgroundColor = UIColor(hex: 0x1A1A1A)
            $0.searchTextField.leftView?.tintColor = UIColor(hex: 0x8C8C8C)
            $0.clipsToBounds = true
        }
        
        scrollBox.do {
            $0.backgroundColor = .black
        }
        
    }
    
    private func hierarchy() {
        self.addSubview(scrollView)
        scrollView.addSubview(scrollContentView)
        scrollContentView.addSubviews(scrollWeatherLabel, scrollWeatherSearchBar, scrollBox)
        scrollContentView.addSubviews(scrollWeatherButton)
    }
    
    private func layout() {
        scrollView.snp.makeConstraints() {
            $0.edges.equalToSuperview()
            $0.bottom.equalTo(scrollBox.snp.bottom)
        }
        
        scrollContentView.snp.makeConstraints() {
            $0.top.bottom.width.equalToSuperview()
        }
        
        scrollWeatherLabel.snp.makeConstraints() {
            $0.top.equalToSuperview().inset(97)
            $0.leading.equalToSuperview().inset(20)
        }
        
        scrollWeatherSearchBar.snp.makeConstraints() {
            $0.top.equalTo(scrollWeatherLabel.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.height.equalTo(40)
        }
        
        scrollBox.snp.makeConstraints() {
            $0.top.equalTo(scrollWeatherButton.snp.bottom).offset(10)
            $0.width.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.height.equalTo(1000)
        }
        
        scrollWeatherButton.snp.makeConstraints() {
            $0.top.equalTo(scrollWeatherSearchBar.snp.bottom).offset(24)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(117)
        }
    }
}
