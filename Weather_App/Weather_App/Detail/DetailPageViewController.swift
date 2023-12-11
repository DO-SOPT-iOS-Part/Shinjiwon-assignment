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
    public var VCIndex = 1
    
    // MARK: - UI Components
    public lazy var VCList = [DetailViewController]();
    public var detailPageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    private var detailBottomBar = DetailBottomBar()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setHierarchy()
        setLayout()
        gesture()
        delegate()
    }
    
    // MARK: - Custom Method
    
    private func setUI() {
        detailPageViewController.setViewControllers([VCList[VCIndex]], direction: .forward, animated: true, completion: nil)
    }
    
    private func setHierarchy() {
        self.view.addSubview(detailPageViewController.view)
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
    
    private func gesture() {
        
    }
    
    //    private func target() {
    //
    //    }
    
    private func delegate() {
        detailPageViewController.delegate = self
        detailPageViewController.dataSource = self
        
        let detailVC = DetailViewController()
        for detailVC in VCList {
            detailVC.protocolDelegate = self
        }
    }
}

extension DetailPageViewController : UIPageViewControllerDelegate {}
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
        print("💗\(page)")
    }
}
