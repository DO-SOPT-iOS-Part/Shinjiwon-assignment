//
//  ViewController.swift
//  Weather_App
//
//  Created by 신지원 on 12/11/23.
//

import UIKit

import SnapKit
import Then

class DetailPageViewController: UIViewController {
    
    // MARK: - Properties
    var VCIndex = 1
    var weatherDummy : [Weathers] = []
    
    // MARK: - UI Components
    lazy var VCList = [DetailViewController]();
    var detailPageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    var detailBottomBar = DetailBottomBar()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate()
        
        setHierarchy()
        setLayout()
    }
    
    // MARK: - Custom Method
    
    func initializePageViewController(with index: Int) {
        let currentVC = VCList[index]
        detailPageViewController.setViewControllers([currentVC], direction: .forward, animated: false, completion: nil)
    }
    
    private func setHierarchy() {
        self.addChild(detailPageViewController)
        self.view.addSubview(detailPageViewController.view)
        detailPageViewController.didMove(toParent: self)
        detailPageViewController.view.addSubview(detailBottomBar)
    }
    
    private func setLayout() {
        detailPageViewController.view.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        detailBottomBar.snp.makeConstraints() {
            $0.bottom.leading.trailing.equalToSuperview()
            $0.height.equalTo(82)
        }
    }
    
    private func delegate() {
        detailPageViewController.delegate = self
        detailPageViewController.dataSource = self
        
        for detailVC in VCList {
            detailVC.protocolDelegate = self
            detailVC.weatherDummy = weatherDummy
            detailVC.VCListNum = VCList.count
        }
    }
}

extension DetailPageViewController : UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard completed else { return }
        if let viewController = pageViewController.viewControllers?.first {
            detailBottomBar.detailPageController.currentPage = VCList.firstIndex(of: viewController as! DetailViewController) ?? 0
        }
    }
}
extension DetailPageViewController : UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let currentIndex = VCList.firstIndex(of: viewController as! DetailViewController), currentIndex > 0 {
            return VCList[currentIndex - 1]
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let currentIndex = VCList.firstIndex(of: viewController as! DetailViewController), currentIndex < VCList.count - 1 {
            return VCList[currentIndex + 1]
        }
        return nil
    }
}

extension DetailPageViewController : DetailViewControllerDelegate {
    func pageScroll(_ page : Int) {
        detailBottomBar.detailPageController.currentPage = page
    }
}
