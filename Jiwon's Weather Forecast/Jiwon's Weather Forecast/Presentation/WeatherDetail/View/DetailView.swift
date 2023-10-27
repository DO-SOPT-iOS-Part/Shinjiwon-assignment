//
//  WeatherDetailView.swift
//  Jiwon's Weather Forecast
//
//  Created by 신지원 on 10/18/23.
//

import UIKit

import SnapKit
import Then

class DetailView: UIView {
    
    // MARK: - Properties
    
    // MARK: - UI Components
    var detailImageView = UIImageView()
    var detailScrollView = UIScrollView()
    var detailContentView = UIView()
    var detailInfoView = DetailInfoView()
    var detailListScrollView = DetailLiveScrollView()
    var detailBottomBar = DetailBottomBar()
    
    var scrollbox = UIView()
    
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
        detailScrollView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.isUserInteractionEnabled = true
            $0.isScrollEnabled = true
            $0.showsVerticalScrollIndicator = true
        }
        
        detailImageView.do {
            $0.image = Image.weatherLarge
        }
        
        detailListScrollView.do {
            $0.layer.cornerRadius = 15
            $0.layer.borderWidth = 0.2
            $0.layer.borderColor = UIColor(white: 1.0, alpha: 0.4).cgColor
        }
        
        scrollbox.do {
            $0.backgroundColor = .clear
        }
        
        detailBottomBar.do {
            $0.backgroundColor = UIColor(hex: 0x2A3040)
        }
    }
    
    private func hierarchy() {
        self.addSubviews(detailImageView, detailScrollView, detailBottomBar)
        detailScrollView.addSubview(detailContentView)
        detailContentView.addSubviews(detailInfoView, detailListScrollView, scrollbox)
    }
    
    private func layout() {
        detailImageView.snp.makeConstraints() {
            $0.edges.equalToSuperview()
        }
        
        detailBottomBar.snp.makeConstraints() {
            $0.bottom.leading.trailing.equalToSuperview()
            $0.height.equalTo(82)
        }
        
        detailScrollView.snp.makeConstraints() {
            $0.edges.equalToSuperview()
            $0.bottom.equalTo(scrollbox.snp.bottom)
        }
        
        detailContentView.snp.makeConstraints() {
            $0.centerX.equalToSuperview()
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
        
        detailInfoView.snp.makeConstraints() {
            $0.top.equalToSuperview().inset(34)
            $0.width.equalToSuperview()
            $0.bottom.equalTo(detailInfoView.detailHighTemLabel.snp.bottom)
        }
        
        
        detailListScrollView.snp.makeConstraints() {
            $0.top.equalTo(detailInfoView.snp.bottom).offset(44)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(212)
        }
        
        scrollbox.snp.makeConstraints() {
            $0.top.equalTo(detailListScrollView.snp.bottom)
            $0.width.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.height.equalTo(1000)
        }
    }
}
