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

        delegate()
    }
    
    // MARK: - Custom Method
    
    private func delegate() {
        rootView.detailTableView.delegate = self
        rootView.detailTableView.dataSource = self
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

extension DetailViewController: UITableViewDelegate {}
extension DetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailTableViewCell.identifier, for: indexPath) as? DetailTableViewCell else { return DetailTableViewCell() }
        cell.dataBind(weatherDummy[VCNum])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 1250
    }
}
