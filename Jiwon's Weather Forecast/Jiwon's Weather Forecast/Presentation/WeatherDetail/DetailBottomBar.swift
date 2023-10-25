//
//  DetailBottomBar.swift
//  Jiwon's Weather Forecast
//
//  Created by 신지원 on 10/25/23.
//

import UIKit

import SnapKit
import Then

class DetailBottomBar: UIView {
    
    // MARK: - Properties
    
    // MARK: - UI Components
    var detailMapButton = UIButton()
    var detailListButton = UIButton()
    var detailNaviButton = UIButton()
    var detailDotButton = UIButton()
    
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
        detailMapButton.do {
            $0.setImage(Image.iconMap, for: .normal)
            $0.isUserInteractionEnabled = true
        }
        
        detailListButton.do {
            $0.setImage(Image.iconList, for: .normal)
            $0.isUserInteractionEnabled = true
        }
        
        detailNaviButton.do {
            $0.setImage(Image.iconNavigation, for: .normal)
            $0.isUserInteractionEnabled = true
        }
        
        detailDotButton.do {
            $0.setImage(Image.iconDot, for: .normal)
            $0.isUserInteractionEnabled = true
        }
    }
    
    private func hierarchy() {
        self.addSubviews(detailMapButton, detailDotButton, detailListButton, detailNaviButton)
    }
    
    private func layout() {
        detailMapButton.snp.makeConstraints() {
            $0.top.equalToSuperview().inset(4)
            $0.leading.equalToSuperview().inset(10)
            $0.size.equalTo(44)
        }
        
        detailListButton.snp.makeConstraints() {
            $0.top.equalToSuperview().inset(4)
            $0.trailing.equalToSuperview().inset(10)
            $0.size.equalTo(44)
        }
        
        detailNaviButton.snp.makeConstraints() {
            $0.top.equalToSuperview().inset(14)
            $0.trailing.equalTo(super.snp.centerX)
            $0.size.equalTo(24)
        }
        
        detailDotButton.snp.makeConstraints() {
            $0.top.equalToSuperview().inset(14)
            $0.leading.equalTo(super.snp.centerX)
            $0.size.equalTo(24)
        }
    }
}
