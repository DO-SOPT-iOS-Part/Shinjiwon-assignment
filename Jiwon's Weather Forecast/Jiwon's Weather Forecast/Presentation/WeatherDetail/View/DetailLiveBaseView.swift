//
//  DetailCellBaseView.swift
//  Jiwon's Weather Forecast
//
//  Created by 신지원 on 10/18/23.
//

import UIKit

class DetailLiveBaseView: UIView {
    
    // MARK: - UI Components
    var detailTime = UILabel()
    var detailIcon = UIImageView()
    var detailTemp = UILabel()
    
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
        detailTime.do {
            $0.font = .SFPro(.medium, size: 17)
            $0.textColor = .white
        }
        
        detailTemp.do {
            $0.font = .SFPro(.medium, size: 22)
            $0.textColor = .white
        }
    }
    
    private func hierarchy() {
        self.addSubviews(detailIcon, detailTime, detailTemp)
    }
    
    private func layout() {
        detailIcon.snp.makeConstraints() {
            $0.top.equalToSuperview().inset(50)
            $0.centerX.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
        }
        
        detailTime.snp.makeConstraints() {
            $0.bottom.equalTo(detailIcon.snp.top).offset(-14)
            $0.centerX.equalToSuperview()
        }
        
        detailTemp.snp.makeConstraints() {
            $0.top.equalTo(detailIcon.snp.bottom).offset(14)
            $0.centerX.equalToSuperview()
        }
    }
}
