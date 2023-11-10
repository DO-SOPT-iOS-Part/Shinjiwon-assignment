//
//  ListTableView.swift
//  Jiwon's Weather Forecast
//
//  Created by 신지원 on 11/5/23.
//

import UIKit

import SnapKit
import Then

class ListTableView: UITableView {

    // MARK: - Life Cycle
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: .zero, style: .grouped)
        
        register()

        tableStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func register() {
        self.register(ListHeaderView.self, forHeaderFooterViewReuseIdentifier: ListHeaderView.cellIdentifier)
        self.register(ListTableViewCell.self, forCellReuseIdentifier: ListTableViewCell.cellIdentifier)
    }
    
    private func tableStyle() {
        self.do {
            $0.backgroundColor = .clear
            $0.showsVerticalScrollIndicator = false
            $0.separatorStyle = .none
            $0.isScrollEnabled = true
        }
    }
}
