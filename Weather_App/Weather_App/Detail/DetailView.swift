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
    
    // MARK: - UI Components
    let detailCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    
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
        detailCollectionView.register(DetailCollectionViewCell.self, forCellWithReuseIdentifier: DetailCollectionViewCell.identifier)
    }
    
    private func style() {
        detailCollectionView.do {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            
            $0.backgroundColor = UIColor(hex: 0x2A3040)
            $0.collectionViewLayout = layout
            $0.isPagingEnabled = true
            $0.decelerationRate = UIScrollView.DecelerationRate.fast
            $0.isScrollEnabled = true
            $0.showsHorizontalScrollIndicator = false
        }
        
    }
    
    private func hierarchy() {
        self.addSubviews( detailCollectionView)
    }
    
    private func layout() {
        
        detailCollectionView.snp.makeConstraints() {
            $0.top.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
}

