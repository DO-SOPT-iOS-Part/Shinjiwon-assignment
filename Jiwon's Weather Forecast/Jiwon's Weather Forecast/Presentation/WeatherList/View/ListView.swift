//
//  WeatherListScrollView.swift
//  Jiwon's Weather Forecast
//
//  Created by 신지원 on 2023/10/17.
//

import UIKit

class ListView: UIView {
    
    // MARK: - Properties
    var dataNum = listData.count - 1
    let placeholder: String = "도시 또는 공항 검색"
    private lazy var attributedString = NSMutableAttributedString(string: placeholder,
                                                                  attributes:
                                                                    [NSAttributedString.Key.font: UIFont(name: "SFProDisplay-Regular", size: 19)!,
                                                                     NSAttributedString.Key.foregroundColor: UIColor(hex: 0x8C8C8C)])
    
    // MARK: - UI Components
    var listScrollView = UIScrollView()
    var listContentView = UIView()
    var listStackView = UIStackView()
    var listWeatherLabel = UILabel()
    var listWeatherSearchBar = UISearchBar()
    
    var listWeatherButton0 = ListBaseButton()
    var listWeatherButton1 = ListBaseButton()
    var listWeatherButton2 = ListBaseButton()
    var listWeatherButton3 = ListBaseButton()
    var listWeatherButton4 = ListBaseButton()
    
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
        
        listScrollView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.isUserInteractionEnabled = true
            $0.isScrollEnabled = true
            $0.showsVerticalScrollIndicator = true
            //스크롤 안되는 문제점 해결하기
            $0.canCancelContentTouches = true
        }
        
        listStackView.do {
            $0.axis = .vertical
            $0.distribution = .fillEqually
            $0.spacing = 24
        }
        
        listWeatherLabel.do {
            $0.text = "날씨"
            $0.font = .SFPro(.bold, size: 36)
            $0.textColor = .white
        }
        
        listWeatherSearchBar.do {
            $0.searchTextField.backgroundColor = UIColor(hex: 0x1A1A1A)
            $0.searchTextField.leftView?.tintColor = UIColor(hex: 0x8C8C8C)
            $0.searchTextField.attributedPlaceholder = attributedString
            $0.searchTextField.textColor = .white
            $0.clipsToBounds = true
            $0.setShowsCancelButton(false, animated: true)
            $0.barTintColor = .clear
            $0.setImage(UIImage(), for: UISearchBar.Icon.clear, state: .normal)
        }
        
        let weatherButton = [listWeatherButton0, listWeatherButton1, listWeatherButton2, listWeatherButton3, listWeatherButton4]
        
        for i in 0...dataNum {
            var button = weatherButton[i]
            button.do {
                $0.placeLabel.text = listData[i].place
                $0.timeLabel.text = listData[i].time
                $0.weatherLabel.text = listData[i].weather
                $0.currentTemLabel.text = listData[i].currentTem + "°"
                $0.highTemLabel.text = "최고:" + listData[i].highTem + "°"
                $0.lowTemLabel.text = "최저:" + listData[i].lowTem + "°"
                $0.tag = i
                
                $0.isExclusiveTouch = true
                $0.isMultipleTouchEnabled = true
            }
        }
        
        scrollBox.do {
            $0.backgroundColor = .black
        }
    }
    
    private func hierarchy() {
        self.addSubview(listScrollView)
        listScrollView.addSubview(listContentView)
        listContentView.addSubviews(listWeatherLabel, listWeatherSearchBar, listStackView)
        
        let weatherButton = [listWeatherButton0, listWeatherButton1, listWeatherButton2, listWeatherButton3, listWeatherButton4]
        for i in 0...dataNum {
            var button = weatherButton[i]
            listStackView.addArrangedSubview(button)
        }
    }
    
    private func layout() {
        listScrollView.snp.makeConstraints() {
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
        
        listContentView.snp.makeConstraints() {
            $0.top.bottom.width.equalToSuperview()
        }
        
        listWeatherLabel.snp.makeConstraints() {
            $0.top.equalToSuperview().inset(97)
            $0.leading.equalToSuperview().inset(20)
        }
        
        listWeatherSearchBar.snp.makeConstraints() {
            $0.top.equalTo(listWeatherLabel.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.height.equalTo(40)
        }
        
        listStackView.snp.makeConstraints() {
            $0.top.equalTo(listWeatherSearchBar.snp.bottom).offset(24)
            $0.bottom.width.equalToSuperview()
        }
        
        let weatherButton = [listWeatherButton0, listWeatherButton1, listWeatherButton2, listWeatherButton3, listWeatherButton4]
        
        for i in 0...dataNum {
            var button = weatherButton[i]
            button.snp.makeConstraints() {
                $0.leading.trailing.equalToSuperview().inset(20)
                $0.height.equalTo(117)
            }
        }
    }
}
