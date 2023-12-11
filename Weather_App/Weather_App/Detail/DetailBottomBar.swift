//
//  DetailBottomBar.swift
//  Weather_App
//
//  Created by 신지원 on 12/12/23.
//

import UIKit

import SnapKit
import Then

class DetailBottomBar: UIView {
    
    // MARK: - Properties
    
    // MARK: - UI Components
    var detailMapButton = UIButton()
    var detailListButton = UIButton()
    let detailPageController = UIPageControl()
    
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
        self.backgroundColor = UIColor(hex: 0x2A3040)
        
        detailMapButton.do {
            $0.setImage(Image.iconMap, for: .normal)
            $0.isUserInteractionEnabled = true
        }
        
        detailListButton.do {
            $0.setImage(Image.iconList, for: .normal)
            $0.isUserInteractionEnabled = true
        }
        
        detailPageController.do {
            $0.hidesForSinglePage = false
            $0.numberOfPages = 5
            $0.pageIndicatorTintColor = .gray
            $0.currentPageIndicatorTintColor = .white
        }
    }
    
    private func hierarchy() {
        self.addSubviews(detailMapButton, detailListButton, detailPageController)
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
        
        detailPageController.snp.makeConstraints() {
            $0.top.equalToSuperview().inset(14)
            $0.centerX.equalToSuperview()
        }
    }
}
