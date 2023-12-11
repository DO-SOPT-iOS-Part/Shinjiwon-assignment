//
//  DetailLiveCollectionViewCell.swift
//  Jiwon's Weather Forecast
//
//  Created by 신지원 on 11/8/23.
//

import UIKit

class DetailLiveCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    static let identifier: String = "DetailLiveCollectionViewCell"
    
    // MARK: - UI Components
    var detailTime = UILabel()
    var detailIcon = UIImageView()
    var detailTemp = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        hierarchy()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
            $0.size.equalTo(44)
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
    
//    func dataBind(tag : Int){
//        detailIcon.image = detailLiveData[tag].icon.image
//        detailTime.text = detailLiveData[tag].time
//        detailTemp.text = detailLiveData[tag].tem + "°"
//    }
}
