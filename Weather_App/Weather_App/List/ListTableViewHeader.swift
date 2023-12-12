//
//  ListTableViewHeader.swift
//  Weather_App
//
//  Created by 신지원 on 12/11/23.
//

import UIKit

import SnapKit
import Then

class ListTableViewHeader: UITableViewHeaderFooterView {
    
    // MARK: - Properties
    
    static let identifier: String = "ListTableViewHeader"
 
    // MARK: - UI Components
    
    var listWeatherLabel = UILabel()
    var listWeatherSearchBar = UISearchBar()
    
    // MARK: - Life Cycle
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        style()
        hierarchy()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Custom Method
    
    private func style() {
        listWeatherLabel.do {
            $0.text = "날씨"
            $0.font = .SFPro(.bold, size: 36)
            $0.textColor = .white
        }
        
        listWeatherSearchBar.do {
            $0.backgroundColor = .clear
            $0.placeholder = "도시 또는 공항 검색"
            $0.barStyle = .black
            $0.clipsToBounds = true
            $0.setShowsCancelButton(false, animated: true)
            $0.barTintColor = .clear
            $0.setImage(UIImage(), for: UISearchBar.Icon.clear, state: .normal)
        }
    }
    
    private func hierarchy() {
        self.addSubviews(listWeatherLabel, listWeatherSearchBar)
    }
    
    private func layout() {
        listWeatherLabel.snp.makeConstraints() {
            $0.top.equalToSuperview().inset(53)
            $0.leading.equalToSuperview().inset(20)
        }
        
        listWeatherSearchBar.snp.makeConstraints() {
            $0.top.equalTo(listWeatherLabel.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.height.equalTo(40)
        }
    }
}

