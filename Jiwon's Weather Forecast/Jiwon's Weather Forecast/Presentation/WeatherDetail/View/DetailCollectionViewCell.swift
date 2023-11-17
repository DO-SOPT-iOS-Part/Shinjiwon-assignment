//
//  DetailCollectionViewCell.swift
//  Jiwon's Weather Forecast
//
//  Created by 신지원 on 11/8/23.
//

import UIKit

import SnapKit
import Then

class DetailCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    // MARK: - UI Components
    let detailBackImageView = UIImageView()
    let detailTableView = DetailTableView()
    
    // MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        cellStyle()
        hierarchy()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    private func delegate() {
//        detailTableView.delegate = self
//        detailTableView.dataSource = self
//    }
    
    private func cellStyle() {
        self.backgroundColor = UIColor(hex: 0x2A3040)
        
        detailBackImageView.do {
            $0.image = .weatherLarge
        }
        
        detailTableView.do {
            $0.backgroundColor = .clear
            $0.isScrollEnabled = true
            $0.showsVerticalScrollIndicator = true
        }
    }
    private func hierarchy() {
        self.addSubviews(detailBackImageView, detailTableView)
    }
    private func layout() {
        detailBackImageView.snp.makeConstraints() {
            $0.edges.equalToSuperview()
        }
        
        detailTableView.snp.makeConstraints() {
            $0.edges.equalToSuperview()
        }
    }
    
    func dataBind(tag : Int){
        detailTableView.detailHeaderView.detailPlaceLabel.text = listData[tag].place
        detailTableView.detailHeaderView.detailWeatherLabel.text = listData[tag].weather
        detailTableView.detailHeaderView.detailCurrentTemLabel.text = listData[tag].currentTem + "°"
        detailTableView.detailHeaderView.detailHighTemLabel.text = "최고:" + listData[tag].highTem + "°"
        detailTableView.detailHeaderView.detailLowTemLabel.text = "최저:" + listData[tag].lowTem + "°"
    }
}
//
//extension DetailCollectionViewCell : UITableViewDelegate {}
//extension DetailCollectionViewCell : UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 1
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = UITableViewCell()
//        return cell
//    }
//    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        <#code#>
//    }
//    
//}
