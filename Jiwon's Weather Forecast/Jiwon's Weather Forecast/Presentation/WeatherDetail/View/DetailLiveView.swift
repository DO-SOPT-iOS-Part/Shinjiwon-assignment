//
//  DetailListScrollView.swift
//  Jiwon's Weather Forecast
//
//  Created by 신지원 on 10/18/23.
//

import UIKit

import SnapKit
import Then

class DetailLiveView: UIView {
    
    // MARK: - Properties
    
    // MARK: - UI Components
    let detailLiveLabel = UILabel()
    let detailLiveBar = UIView()
    let detailLiveCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    
    // MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
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
        detailLiveCollectionView.delegate = self
        detailLiveCollectionView.dataSource = self
    }
    
    private func register() {
        detailLiveCollectionView.register(DetailLiveCollectionViewCell.self, forCellWithReuseIdentifier: DetailLiveCollectionViewCell.cellIdentifier)
    }
    
    private func style() {
        self.do {
            $0.layer.cornerRadius = 15
            $0.backgroundColor = .clear
            $0.layer.borderWidth = 0.2
            $0.layer.borderColor = UIColor(white: 1.0, alpha: 0.5).cgColor
        }
        
        detailLiveLabel.do {
            $0.text = "08:00~09:00에 강우 상태가, 18:00에 한때 흐린 상태가 예상됩니다."
            $0.font = .SFPro(.regular, size: 18)
            $0.textColor = .white
            $0.numberOfLines = 0
        }
        
        detailLiveBar.do {
            $0.backgroundColor = UIColor(white: 1.0, alpha: 0.5)
        }
        
        detailLiveCollectionView.do {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            
            $0.backgroundColor = .clear
            $0.collectionViewLayout = layout
            $0.isScrollEnabled = true
        }
    }
    
    private func hierarchy() {
        self.addSubviews(detailLiveLabel, detailLiveBar, detailLiveCollectionView)
    }
    
    private func layout() {
        detailLiveLabel.snp.makeConstraints() {
            $0.top.equalToSuperview().inset(10)
            $0.leading.equalToSuperview().inset(15)
            $0.trailing.equalToSuperview().inset(15)
        }
        
        detailLiveBar.snp.makeConstraints() {
            $0.top.equalTo(detailLiveLabel.snp.bottom).offset(11)
            $0.leading.trailing.equalToSuperview().inset(15)
            $0.height.equalTo(0.2)
        }
        
        detailLiveCollectionView.snp.makeConstraints() {
            $0.top.equalTo(detailLiveBar.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
}

extension DetailLiveView : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 22
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 44, height: 146)
    }
}
extension DetailLiveView : UICollectionViewDelegate {}

extension DetailLiveView : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return detailLiveData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailLiveCollectionViewCell.cellIdentifier, for: indexPath) as? DetailLiveCollectionViewCell else { return UICollectionViewCell() }
        cell.dataBind(tag: indexPath.row)
        return cell
    }
}

