//
//  WeatherDetailViewController.swift
//  Jiwon's Weather Forecast
//
//  Created by 신지원 on 10/18/23.
//

import UIKit

import SnapKit
import Then

class DetailViewController: UIViewController {
    
    // MARK: - Properties
    
    // MARK: - UI Components
    
    let rootView = DetailView()
    
    // MARK: - Life Cycle
    override func loadView() {
        self.view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gesture()
        target()
        delegate()
    }
    
    // MARK: - Custom Method
    
    private func gesture() {
        rootView.detailBottomBar.detailListButton.addTarget(self, action: #selector(detailListBtnTap), for: .touchUpInside)
    }
    
    private func target() {
        
    }
    
    private func delegate() {
        rootView.detailCollectionView.delegate = self
        rootView.detailCollectionView.dataSource = self
    }
    
    //MARK: - Action Method
    
    @objc
    func detailListBtnTap() {
        self.navigationController?.popViewController(animated: true)
    }
}

extension DetailViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width , height: UIScreen.main.bounds.height)
    }
}

extension DetailViewController : UICollectionViewDelegate {
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let page = Int(targetContentOffset.pointee.x / UIScreen.main.bounds.width)
        
        if(page < listData.count ){
            rootView.detailBottomBar.detailPageController.currentPage = page
        }
    }
}

extension DetailViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailCollectionViewCell.cellIdentifier, for: indexPath) as? DetailCollectionViewCell else { return UICollectionViewCell() }
        cell.dataBind(tag: indexPath.row)
        return cell
    }
}
