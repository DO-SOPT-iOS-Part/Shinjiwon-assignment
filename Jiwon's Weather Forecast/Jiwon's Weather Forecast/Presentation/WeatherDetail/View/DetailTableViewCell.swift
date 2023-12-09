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
    
    func dataBind(tag : Int){
        detailHeaderView.detailPlaceLabel.text = listData[tag].place
        detailHeaderView.detailWeatherLabel.text = listData[tag].weather
        detailHeaderView.detailCurrentTemLabel.text = listData[tag].currentTem + "°"
        detailHeaderView.detailHighTemLabel.text = "최고:" + listData[tag].highTem + "°"
        detailHeaderView.detailLowTemLabel.text = "최저:" + listData[tag].lowTem + "°"
    }
}
