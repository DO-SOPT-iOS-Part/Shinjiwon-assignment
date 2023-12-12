//
//  DetailView.swift
//  Weather_App
//
//  Created by 신지원 on 12/11/23.
//

import UIKit

import SnapKit
import Then

class DetailView: UIView {
    
    // MARK: - Properties
    
    var VCListNum = 0
    var weatherData = Weathers()
    
    // MARK: - UI Components
    
    let detailBackImageView = UIImageView()
    let detailTableView = UITableView()
    
    // MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)

        register()
        
        style()
        hierarchy()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Custom Method
    
    private func register() {
        detailTableView.register(DetailTableViewCell.self, forCellReuseIdentifier: DetailTableViewCell.identifier)
    }
    
    private func style() {
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
}
