//
//  DetailTableView.swift
//  Jiwon's Weather Forecast
//
//  Created by 신지원 on 11/8/23.
//

import UIKit

class DetailTableView: UITableView {

    // MARK: - Properties
    var num = 0
    
    // MARK: - UI Components
    let detailHeaderView = DetailHeaderView()
    let detailLiveView = DetailLiveView()
    let detailWeekView = DetailWeekView()

    // MARK: - Life Cycle
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)

        hierarchy()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
//            $0.height.equalTo(678)
        }
    }
}
