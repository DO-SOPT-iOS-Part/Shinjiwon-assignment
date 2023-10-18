//
//  WeatherDetailView.swift
//  Jiwon's Weather Forecast
//
//  Created by 신지원 on 10/18/23.
//

import UIKit

import SnapKit
import Then

class WeatherDetailView: UIView {
    
    // MARK: - Properties
    
    // MARK: - UI Components
    var detailPlaceLabel = UILabel()
    var detailTimeLabel = UILabel()
    var detailWeatherLabel = UILabel()
    var detailCurrentTemLabel = UILabel()
    var detailHighTemLabel = UILabel()
    var detailLowTemLabel = UILabel()
    
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
        detailPlaceLabel.do{
            
        }
        detailTimeLabel.do {
            
        }
        detailWeatherLabel.do {
            
        }
        detailCurrentTemLabel.do {
            
        }
        detailHighTemLabel.do {
            
        }
        detailLowTemLabel.do {
            
        }
    }
    
    private func hierarchy() {
        
    }
    
    private func layout() {
        detailPlaceLabel.snp.makeConstraints() {
            
        }
        detailTimeLabel.snp.makeConstraints() {
            
        }
        detailWeatherLabel.snp.makeConstraints() {
            
        }
        detailCurrentTemLabel.snp.makeConstraints() {
            
        }
        detailHighTemLabel.snp.makeConstraints() {
            
        }
        detailLowTemLabel.snp.makeConstraints() {
            
        }
    }
    
    
}
