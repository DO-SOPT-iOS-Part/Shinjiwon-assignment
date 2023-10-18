//
//  WeatherDetailView.swift
//  Jiwon's Weather Forecast
//
//  Created by 신지원 on 10/18/23.
//

import UIKit

import SnapKit
import Then

class WeatherDetailView: UIView {
    
    // MARK: - Properties
    
    // MARK: - UI Components
    var detailImageView = UIImageView()
    var detailScrollView = UIScrollView()
    var detailContentView = UIView()
    var detailInfoView = DetailInfoView()
    
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
        scrollbox.do {
            $0.backgroundColor = .clear
        }
    }
    
    private func hierarchy() {
        self.addSubviews(detailImageView,detailScrollView)
        detailScrollView.addSubview(detailContentView)
        detailContentView.addSubviews(detailInfoView, scrollbox)
    }
    
    private func layout() {
        detailImageView.snp.makeConstraints() {
            $0.edges.equalToSuperview()
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
            $0.top.equalToSuperview().inset(78)
            $0.width.equalToSuperview()
        }
        
        scrollbox.snp.makeConstraints() {
            $0.top.equalTo(detailInfoView.snp.bottom)
            $0.width.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.height.equalTo(1000)
        }
    }
}
