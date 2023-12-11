//
//  ListTableView.swift
//  Weather_App
//
//  Created by 신지원 on 12/11/23.
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
        self.register(ListTableViewHeader.self, forHeaderFooterViewReuseIdentifier: ListTableViewHeader.identifier)
        self.register(ListTableViewCell.self, forCellReuseIdentifier: ListTableViewCell.identifier)
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

