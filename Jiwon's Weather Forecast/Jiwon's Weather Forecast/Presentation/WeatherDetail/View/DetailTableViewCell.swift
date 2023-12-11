//
//  DetailTableViewCell.swift
//  Jiwon's Weather Forecast
//
//  Created by 신지원 on 12/10/23.
//

import UIKit

import SnapKit
import Then

class DetailTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    public var weatherDummy: [Weathers] = []

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
            $0.top.equalToSuperview().inset(78)
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
    
    func dataBind(){
//        detailHeaderView.detailPlaceLabel.text = weatherdummy[0].name
//        detailHeaderView.detailWeatherLabel.text = weatherdummy[0].weather.first?.description
//        detailHeaderView.detailCurrentTemLabel.text = String(weatherdummy[0].main.temp) + "°"
//        detailHeaderView.detailHighTemLabel.text = "최고:" + String(weatherdummy[0].main.temp_max) + "°"
//        detailHeaderView.detailLowTemLabel.text = "최저:" + String(weatherdummy[0].main.temp_min) + "°"
    }
}
