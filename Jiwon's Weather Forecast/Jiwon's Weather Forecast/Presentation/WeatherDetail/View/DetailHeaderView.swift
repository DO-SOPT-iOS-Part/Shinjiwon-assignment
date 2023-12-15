//
//  DetailTableHeaderView.swift
//  Jiwon's Weather Forecast
//
//  Created by 신지원 on 11/9/23.
//

import UIKit

import SnapKit
import Then

class DetailHeaderView: UIView {

    // MARK: - UI Components
    var detailPlaceLabel = UILabel()
    var detailWeatherLabel = UILabel()
    var detailCurrentTemLabel = UILabel()
    var detailHighTemLabel = UILabel()
    var detailLowTemLabel = UILabel()
    
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
        detailPlaceLabel.do{
            $0.text = "짠"
            $0.font = .SFPro(.regular, size: 36)
            $0.textColor = .white
        }
        detailWeatherLabel.do {
            $0.text = "짠"
            $0.font = .SFPro(.regular, size: 24)
            $0.textColor = .white
        }
        detailCurrentTemLabel.do {
            $0.text = "21"
            $0.font = .SFPro(.thin, size: 102)
            $0.textColor = .white
        }
        detailHighTemLabel.do {
            $0.text = "짠"
            $0.font = .SFPro(.medium, size: 20)
            $0.textColor = .white
        }
        detailLowTemLabel.do {
            $0.text = "짠"
            $0.font = .SFPro(.medium, size: 20)
            $0.textColor = .white
        }
    }
    
    private func hierarchy() {
        self.addSubviews(detailPlaceLabel, detailWeatherLabel, detailCurrentTemLabel, detailLowTemLabel, detailHighTemLabel)
    }
    
    private func layout() {
        detailPlaceLabel.snp.makeConstraints() {
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
        
        detailCurrentTemLabel.snp.makeConstraints() {
            $0.top.equalTo(detailPlaceLabel.snp.bottom).offset(4)
            $0.centerX.equalToSuperview()
        }
        
        detailWeatherLabel.snp.makeConstraints() {
            $0.top.equalTo(detailCurrentTemLabel.snp.bottom).offset(4)
            $0.centerX.equalToSuperview()
        }
        
        detailHighTemLabel.snp.makeConstraints() {
            $0.top.equalTo(detailWeatherLabel.snp.bottom).offset(4)
            $0.trailing.equalTo(super.snp.centerX).offset(-2)
        }
        detailLowTemLabel.snp.makeConstraints() {
            $0.top.equalTo(detailWeatherLabel.snp.bottom).offset(4)
            $0.leading.equalTo(super.snp.centerX).offset(2)
        }
    }
}
