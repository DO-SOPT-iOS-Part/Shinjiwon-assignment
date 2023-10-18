//
//  DetailListScrollView.swift
//  Jiwon's Weather Forecast
//
//  Created by 신지원 on 10/18/23.
//

import UIKit

import SnapKit
import Then

class DetailLiveScrollView: UIView {
    
    // MARK: - Properties
    let dataNum = detailData.count
    
    // MARK: - UI Components
    let detailLiveLabel = UILabel()
    let detailLiveBar = UIView()
    var detailLiveScrollView = UIScrollView()
    var detailLiveContentView = UIView()
    
    var detailLiveView0 = DetailLiveBaseView()
    var detailLiveView1 = DetailLiveBaseView()
    var detailLiveView2 = DetailLiveBaseView()
    var detailLiveView3 = DetailLiveBaseView()
    var detailLiveView4 = DetailLiveBaseView()
    var detailLiveView5 = DetailLiveBaseView()
    var detailLiveView6 = DetailLiveBaseView()
    var detailLiveView7 = DetailLiveBaseView()
    var detailLiveView8 = DetailLiveBaseView()
    var detailLiveView9 = DetailLiveBaseView()
    
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
        detailLiveLabel.do {
            $0.text = "08:00~09:00에 강우 상태가, 18:00에 한때 흐린 상태가 예상됩니다."
            $0.font = .SFPro(.regular, size: 18)
            $0.textColor = .white
            $0.numberOfLines = 0
        }
        
        detailLiveBar.do {
            $0.backgroundColor = UIColor(white: 1.0, alpha: 0.5)
            
        }
        
        detailLiveScrollView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.isUserInteractionEnabled = true
            $0.isScrollEnabled = true
            $0.showsHorizontalScrollIndicator = true
        }
        
        let weatherView = [detailLiveView0, detailLiveView1, detailLiveView2, detailLiveView3, detailLiveView4, detailLiveView5, detailLiveView6, detailLiveView7, detailLiveView8, detailLiveView9]
        
        for i in 0...9 {
            var view = weatherView[i]
            view.detailTime.text = detailData[i].time
            view.detailIcon.image = detailData[i].icon.image
            view.detailTemp.text = detailData[i].tem + "°"
            view.isUserInteractionEnabled = false
        }
    }
    
    private func hierarchy() {
        self.addSubviews(detailLiveLabel, detailLiveBar, detailLiveScrollView)
        detailLiveScrollView.addSubview(detailLiveContentView)
        
        let weatherView = [detailLiveView0, detailLiveView1, detailLiveView2, detailLiveView3, detailLiveView4, detailLiveView5, detailLiveView6, detailLiveView7, detailLiveView8, detailLiveView9]
        
        for i in 0...9 {
            var view = weatherView[i]
            detailLiveContentView.addSubview(view)
        }
    }
    
    private func layout() {
        detailLiveLabel.snp.makeConstraints() {
            $0.top.equalToSuperview().inset(10)
            $0.leading.equalToSuperview().inset(15)
            $0.trailing.equalToSuperview().inset(15)
        }
        
        detailLiveBar.snp.makeConstraints() {
            $0.top.equalTo(detailLiveLabel.snp.bottom).offset(11)
            $0.leading.trailing.equalToSuperview().inset(15)
            $0.height.equalTo(0.2)
        }
        
        detailLiveScrollView.snp.makeConstraints() {
            $0.top.equalTo(detailLiveBar.snp.bottom)
            $0.bottom.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.width.equalTo(15 + dataNum*44 + (dataNum-1)*22)
        }
        
        detailLiveContentView.snp.makeConstraints() {
            $0.top.bottom.width.equalToSuperview()
        }
        
        let weatherView = [detailLiveView0, detailLiveView1, detailLiveView2, detailLiveView3, detailLiveView4, detailLiveView5, detailLiveView6, detailLiveView7, detailLiveView8, detailLiveView9]
        
        detailLiveView0.snp.makeConstraints() {
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
