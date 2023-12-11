//
//  DetailCollectionViewCell.swift
//  Weather_App
//
//  Created by 신지원 on 12/12/23.
//

import UIKit

import SnapKit
import Then

class DetailCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    static let identifier: String = "DetailCollectionViewCell"
    
    // MARK: - UI Components
    let detailBackImageView = UIImageView()
    let detailTableView = UITableView()
    
    // MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        register()
        delegate()
        
        cellStyle()
        hierarchy()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func register() {
        detailTableView.register(DetailTableViewCell.self, forCellReuseIdentifier: DetailTableViewCell.identifier)
    }
    
    private func delegate() {
        detailTableView.delegate = self
        detailTableView.dataSource = self
    }
    
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
}

extension DetailCollectionViewCell: UITableViewDelegate {}
extension DetailCollectionViewCell: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailTableViewCell.identifier, for: indexPath) as? DetailTableViewCell else { return DetailTableViewCell() }
//        cell.dataBind()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 1300.0
    }
}
