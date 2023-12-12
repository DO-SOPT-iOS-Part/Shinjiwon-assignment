//
//  DetailViewController.swift
//  Weather_App
//
//  Created by 신지원 on 12/11/23.
//

import UIKit

import SnapKit
import Then

protocol DetailViewControllerDelegate : AnyObject {
    func pageScroll(_ page : Int)
}

class DetailViewController: UIViewController {
    
    // MARK: - Properties
    var VCNum = Int()
    var VCListNum = Int()
    weak var protocolDelegate : DetailViewControllerDelegate?
    var weatherDummy : [Weathers] = []
    
    // MARK: - UI Components
    private var rootView = DetailView()
    
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
        
    }
    
    private func target() {
        
    }
    
    private func delegate() {
        rootView.detailCollectionView.delegate = self
        rootView.detailCollectionView.dataSource = self
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

        let page = Int(targetContentOffset.pointee.x / scrollView.frame.size.width)
        if(page < weatherDummy.count){
            scrollView.isScrollEnabled = true
            protocolDelegate?.pageScroll(page)
        }
        else {
            scrollView.isScrollEnabled = false
        }
    }
}

extension DetailViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("🥹\(weatherDummy.count)")
        return weatherDummy.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailCollectionViewCell.identifier, for: indexPath) as? DetailCollectionViewCell else { return UICollectionViewCell() }
        cell.weatherData = weatherDummy[indexPath.row]
        return cell
    }
}
