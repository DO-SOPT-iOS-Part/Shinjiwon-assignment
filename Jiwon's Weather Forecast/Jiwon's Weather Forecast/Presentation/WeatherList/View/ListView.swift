//
//  WeatherListScrollView.swift
//  Jiwon's Weather Forecast
//
//  Created by 신지원 on 2023/10/17.
//

import UIKit

import SnapKit
import Then

class ListView: UIView {
    
    // MARK: - Properties

    // MARK: - UI Components
    
    var listTableView = ListTableView()
    
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
        self.do {
            $0.backgroundColor = .black
        }
    }
    
    private func hierarchy() {
        self.addSubview(listTableView)
    }
    
    private func layout() {
        listTableView.snp.makeConstraints() {
            $0.edges.equalToSuperview()
        }
    }
}
