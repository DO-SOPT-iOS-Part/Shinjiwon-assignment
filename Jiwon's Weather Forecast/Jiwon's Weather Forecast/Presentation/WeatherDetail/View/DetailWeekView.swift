//
//  DetailWeekView.swift
//  Jiwon's Weather Forecast
//
//  Created by 신지원 on 11/9/23.
//

import UIKit

import SnapKit
import Then

class DetailWeekView: UIView {
    
    // MARK: - Properties
    
    // MARK: - UI Components
    let detailWeekLabel = UILabel()
    let detailWeekCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    
    // MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        findMaxMin()
        
        delegate()
        register()
        
        style()
        hierarchy()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Custom Method
    private func delegate() {
        detailWeekCollectionView.delegate = self
        detailWeekCollectionView.dataSource = self
    }
    
    private func register() {
        detailWeekCollectionView.register(DetailWeekCollectionViewCell.self, forCellWithReuseIdentifier: DetailWeekCollectionViewCell.identifier)
    }
    
    private func style() {
        self.do {
            $0.layer.cornerRadius = 15
            $0.backgroundColor = .clear
            $0.layer.borderWidth = 0.2
            $0.layer.borderColor = UIColor(white: 1.0, alpha: 0.5).cgColor
        }
        
        detailWeekLabel.do {
            $0.text = "10일간의 일기예보"
            $0.font = .SFPro(.thin, size: 15)
            $0.textColor = UIColor(white: 1.0, alpha: 0.5)
            $0.numberOfLines = 0
        }
        
        detailWeekCollectionView.do {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .vertical
            
            $0.backgroundColor = .clear
            $0.collectionViewLayout = layout
            $0.isScrollEnabled = false
        }
    }
    
    private func hierarchy() {
        self.addSubviews(detailWeekLabel, detailWeekCollectionView)
    }
    
    private func layout() {
        detailWeekLabel.snp.makeConstraints() {
            $0.top.equalToSuperview().inset(10)
            $0.leading.equalToSuperview().inset(15)
            $0.trailing.equalToSuperview().inset(15)
        }
        
        detailWeekCollectionView.snp.makeConstraints() {
            $0.top.equalTo(detailWeekLabel.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(55 * 5)
        }
    }
}

extension DetailWeekView : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 55)
    }
}
extension DetailWeekView : UICollectionViewDelegate {}

extension DetailWeekView : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailWeekCollectionViewCell.identifier, for: indexPath) as? DetailWeekCollectionViewCell else { return UICollectionViewCell() }
//        cell.dataBind(tag: indexPath.row)
        return cell
    }
}



