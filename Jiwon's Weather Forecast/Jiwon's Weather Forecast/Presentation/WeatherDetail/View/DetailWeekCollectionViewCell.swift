//
//  DetailWeekCollectionViewCell.swift
//  Jiwon's Weather Forecast
//
//  Created by 신지원 on 11/9/23.
//

import UIKit

class DetailWeekCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    static let identifier: String = "DetailWeekCollectionViewCell"
    
    // MARK: - UI Components
    var detailDay = UILabel()
    var detailIcon = UIImageView()
    var detailLowTemp = UILabel()
    var detailHighTemp = UILabel()
    var detailGradientTemp = DetailWeekGradientView()
    var detailBar = UIView()
    
    var empty1 : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: 0x2A3040)
        return view
    }()
    
    var empty2 : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: 0x2A3040)
        return view
    }()
    
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
        detailDay.do {
            $0.font = .SFPro(.medium, size: 22)
            $0.textColor = .white
        }
        
        detailLowTemp.do {
            $0.font = .SFPro(.medium, size: 22)
            $0.textColor = UIColor(white: 1.0, alpha: 0.5)
        }
        
        detailHighTemp.do {
            $0.font = .SFPro(.medium, size: 22)
            $0.textColor = .white
        }
        
        detailGradientTemp.do {
            $0.layer.cornerRadius = 44
        }
        
        detailBar.do {
            $0.backgroundColor = UIColor(white: 1.0, alpha: 0.5)
        }
    }
    
    private func hierarchy() {
        self.addSubviews(detailDay, detailIcon, detailLowTemp, detailHighTemp, detailGradientTemp, detailBar, empty1, empty2)
    }
    
    private func layout() {
        detailBar.snp.makeConstraints() {
            $0.top.equalToSuperview()
            $0.trailing.leading.equalToSuperview().inset(16)
            $0.height.equalTo(0.2)
        }
        
        detailDay.snp.makeConstraints() {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(16)
        }
        
        detailIcon.snp.makeConstraints() {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(87)
            $0.size.equalTo(35)
        }
        
        detailHighTemp.snp.makeConstraints() {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(17)
        }
        
        detailLowTemp.snp.makeConstraints() {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(detailIcon.snp.trailing).offset(15)
        }
        
        detailGradientTemp.snp.makeConstraints() {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(173)
            $0.trailing.equalToSuperview().inset(70)
            $0.height.equalTo(4)
        }
    }
    
//    func dataBind(tag : Int){
//        detailIcon.image = detailWeekData[tag].icon.image
//        detailDay.text = detailWeekData[tag].day
//        detailHighTemp.text = String(detailWeekData[tag].highTem) + "°"
//        detailLowTemp.text = String(detailWeekData[tag].lowTem) + "°"
//        
//        var min = (Double)(detailWeekData[tag].lowTem - detailWeekDataMin) / (Double)(detailWeekDataMax - detailWeekDataMin) * 100
//        var max = (Double)(detailWeekDataMax - detailWeekData[tag].highTem) / (Double)(detailWeekDataMax - detailWeekDataMin) * 100
//        print(min)
//        print(max)
//        empty1.snp.makeConstraints() {
//            $0.top.equalTo(detailGradientTemp.snp.top)
//            $0.leading.equalTo(detailGradientTemp.snp.leading)
//            $0.width.equalTo(min)
//            $0.height.equalTo(4)
//        }
//        
//        empty2.snp.makeConstraints() {
//            $0.top.equalTo(detailGradientTemp.snp.top)
//            $0.trailing.equalTo(detailGradientTemp.snp.trailing)
//            $0.width.equalTo(max)
//            $0.height.equalTo(4)
//        }
//    }
}
