//
//  DetailListScrollView.swift
//  Jiwon's Weather Forecast
//
//  Created by 신지원 on 10/18/23.
//

import UIKit

import SnapKit
import Then

class DetailListScrollView: UIView {
    
    // MARK: - Properties
    let dataNum = detailData.count
    
    // MARK: - UI Components
    let detailListLabel = UILabel()
    let detailListBar = UIView()
    var detailListScrollView = UIScrollView()
    var detailListContentView = UIView()
    
    var detailListWeatherView0 = DetailCellBaseView()
    var detailListWeatherView1 = DetailCellBaseView()
    var detailListWeatherView2 = DetailCellBaseView()
    var detailListWeatherView3 = DetailCellBaseView()
    var detailListWeatherView4 = DetailCellBaseView()
    var detailListWeatherView5 = DetailCellBaseView()
    var detailListWeatherView6 = DetailCellBaseView()
    var detailListWeatherView7 = DetailCellBaseView()
    var detailListWeatherView8 = DetailCellBaseView()
    var detailListWeatherView9 = DetailCellBaseView()
    
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
        detailListLabel.do {
            $0.text = "08:00~09:00에 강우 상태가, 18:00에 한때 흐린 상태가 예상됩니다."
            $0.font = .SFPro(.regular, size: 18)
            $0.textColor = .white
            $0.numberOfLines = 0
        }
        
        detailListBar.do {
            $0.backgroundColor = UIColor(white: 1.0, alpha: 0.5)
            
        }
        
        detailListScrollView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.isUserInteractionEnabled = true
            $0.isScrollEnabled = true
            $0.showsHorizontalScrollIndicator = true
        }
        
        let weatherView = [detailListWeatherView0, detailListWeatherView1, detailListWeatherView2, detailListWeatherView3, detailListWeatherView4, detailListWeatherView5, detailListWeatherView6, detailListWeatherView7, detailListWeatherView8, detailListWeatherView9]
        
        for i in 0...9 {
            var view = weatherView[i]
            view.detailTime.text = detailData[i].time
            view.detailIcon.image = detailData[i].icon.image
            view.detailTemp.text = detailData[i].tem + "°"
            view.isUserInteractionEnabled = false
        }
    }
    
    private func hierarchy() {
        self.addSubviews(detailListLabel, detailListBar, detailListScrollView)
        detailListScrollView.addSubview(detailListContentView)
        
        let weatherView = [detailListWeatherView0, detailListWeatherView1, detailListWeatherView2, detailListWeatherView3, detailListWeatherView4, detailListWeatherView5, detailListWeatherView6, detailListWeatherView7, detailListWeatherView8, detailListWeatherView9]
        
        for i in 0...9 {
            var view = weatherView[i]
            detailListContentView.addSubview(view)
        }
    }
    
    private func layout() {
        detailListLabel.snp.makeConstraints() {
            $0.top.equalToSuperview().inset(10)
            $0.leading.equalToSuperview().inset(15)
            $0.trailing.equalToSuperview().inset(15)
        }
        
        detailListBar.snp.makeConstraints() {
            $0.top.equalTo(detailListLabel.snp.bottom).offset(11)
            $0.leading.trailing.equalToSuperview().inset(15)
            $0.height.equalTo(0.2)
        }
        
        detailListScrollView.snp.makeConstraints() {
            $0.top.equalTo(detailListBar.snp.bottom)
            $0.bottom.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.width.equalTo(15 + dataNum*44 + (dataNum-1)*22)
        }
        
        detailListContentView.snp.makeConstraints() {
            $0.top.bottom.width.equalToSuperview()
        }
        
        let weatherView = [detailListWeatherView0, detailListWeatherView1, detailListWeatherView2, detailListWeatherView3, detailListWeatherView4, detailListWeatherView5, detailListWeatherView6, detailListWeatherView7, detailListWeatherView8, detailListWeatherView9]
        
        detailListWeatherView0.snp.makeConstraints() {
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.leading.equalToSuperview().inset(15)
            $0.width.equalTo(44)
        }
        
        for i in 1...9 {
            var view = weatherView[i]
            var exView = weatherView[i-1]
            view.snp.makeConstraints() {
                $0.top.bottom.equalToSuperview()
                $0.leading.equalTo(exView.snp.trailing).offset(22)
                $0.width.equalTo(44)
            }
        }
    }
}
