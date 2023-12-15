//
//  DetailTableViewCell.swift
//  Weather_App
//
//  Created by 신지원 on 12/12/23.
//

import UIKit

import SnapKit
import Then

class DetailTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    static let identifier: String = "DetailTableViewCell"
    
    // MARK: - UI Components
    let detailHeaderView = DetailHeaderView()
    let detailLiveView = DetailLiveView()
    let detailWeekView = DetailWeekView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setStyle()
        hierarchy()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStyle() {
        self.do {
            $0.backgroundColor = .clear
            $0.contentView.isHidden = true
            $0.selectedBackgroundView?.isHidden = true
        }
    }
    
    private func hierarchy() {
        self.addSubviews(detailHeaderView, detailLiveView, detailWeekView)
    }
    
    private func layout() {
        detailHeaderView.snp.makeConstraints() {
            $0.top.equalToSuperview().inset(34)
            $0.width.equalToSuperview()
            $0.height.equalTo(250)
        }
        
        detailLiveView.snp.makeConstraints() {
            $0.top.equalTo(detailHeaderView.snp.bottom).offset(44)
            $0.centerX.equalToSuperview()
            $0.leading.equalTo(20)
            $0.height.equalTo(212)
        }
        
        detailWeekView.snp.makeConstraints() {
            $0.top.equalTo(detailLiveView.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
            $0.leading.equalTo(20)
            $0.height.equalTo(600)
        }
    }
}

extension DetailTableViewCell {
    func dataBind(_ data : Weathers) {
        detailHeaderView.detailPlaceLabel.text = data.name
        detailHeaderView.detailWeatherLabel.text = data.weather.first?.description
        detailHeaderView.detailCurrentTemLabel.text = String(Int(data.main.temp)) + "°"
        detailHeaderView.detailHighTemLabel.text = "highest:" + String(Int(data.main.temp_max)) + "°"
        detailHeaderView.detailLowTemLabel.text = "lowest:" + String(Int(data.main.temp_min)) + "°"
    }
}
