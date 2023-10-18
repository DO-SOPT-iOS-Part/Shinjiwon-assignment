//
//  WeatherListScrollView.swift
//  Jiwon's Weather Forecast
//
//  Created by 신지원 on 2023/10/17.
//

import UIKit

class WeatherListScrollView: UIView {
    
    // MARK: - Properties
    let placeholder: String = "도시 또는 공항 검색"
    private lazy var attributedString = NSMutableAttributedString(string: placeholder,
                                                                  attributes:
                                                                    [NSAttributedString.Key.font: UIFont(name: "SFProDisplay-Regular", size: 19)!,
                                                                     NSAttributedString.Key.foregroundColor: UIColor(hex: 0x8C8C8C)])
    
    // MARK: - UI Components
    var scrollView = UIScrollView()
    var scrollContentView = UIView()
    var scrollWeatherLabel = UILabel()
    var scrollWeatherSearchBar = UISearchBar()
    
    var scrollWeatherButton0 = WeatherBaseButton()
    var scrollWeatherButton1 = WeatherBaseButton()
    var scrollWeatherButton2 = WeatherBaseButton()
    var scrollWeatherButton3 = WeatherBaseButton()
    
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
            $0.searchTextField.backgroundColor = UIColor(hex: 0x1A1A1A)
            $0.searchTextField.leftView?.tintColor = UIColor(hex: 0x8C8C8C)
            $0.searchTextField.attributedPlaceholder = attributedString
            $0.searchTextField.textColor = .white
            $0.clipsToBounds = true
            $0.setShowsCancelButton(false, animated: true)
            $0.barTintColor = .clear
            $0.setImage(UIImage(), for: UISearchBar.Icon.clear, state: .normal)
        }
        
        let weatherButton = [scrollWeatherButton0, scrollWeatherButton1, scrollWeatherButton2, scrollWeatherButton3]
        
        for i in 0...3 {
            var button = weatherButton[i]
            button.placeLabel.text = weatherArry[i].place
            button.timeLabel.text = weatherArry[i].time
            button.weatherLabel.text = weatherArry[i].weather
            button.currentTemLabel.text = weatherArry[i].currentTem + "°"
            button.highTemLabel.text = "최고:" + weatherArry[i].highTem + "°"
            button.lowTemLabel.text = "최저:" + weatherArry[i].lowTem + "°"
        }
        
        scrollBox.do {
            $0.backgroundColor = .black
        }
    }
    
    private func hierarchy() {
        self.addSubview(scrollView)
        scrollView.addSubview(scrollContentView)
        scrollContentView.addSubviews(scrollWeatherLabel, scrollWeatherSearchBar)
        scrollContentView.addSubviews(scrollWeatherButton0,scrollWeatherButton1,scrollWeatherButton2,scrollWeatherButton3, scrollBox)
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
        
        scrollWeatherButton0.snp.makeConstraints() {
            $0.top.equalTo(scrollWeatherSearchBar.snp.bottom).offset(24)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(117)
        }
        
        let weatherButton = [scrollWeatherButton0, scrollWeatherButton1, scrollWeatherButton2, scrollWeatherButton3]
        for i in 1...3 {
            var button = weatherButton[i]
            var exbutton = weatherButton[i-1]
            button.snp.makeConstraints() {
                $0.top.equalTo(exbutton.snp.bottom).offset(24)
                $0.leading.trailing.equalToSuperview().inset(20)
                $0.height.equalTo(117)
            }
        }
        
        scrollBox.snp.makeConstraints() {
            $0.top.equalTo(scrollWeatherButton3.snp.bottom).offset(10)
            $0.width.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.height.equalTo(500)
        }
    }
}
