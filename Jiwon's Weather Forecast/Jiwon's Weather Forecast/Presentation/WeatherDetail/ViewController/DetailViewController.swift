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
    
    private let rootView = DetailView()
    let rightSwipeGesture = UISwipeGestureRecognizer()
    let leftSwipeGesture = UISwipeGestureRecognizer()
    
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
//        rootView.detailBottomBar.detailListButton.addTarget(self, action: #selector(detailListBtnTap), for: .touchUpInside)
        
        rightSwipeGesture.do {
            $0.direction = .right
            $0.addTarget(self, action: #selector(handleSwipe(_:)))
        }
        
        leftSwipeGesture.do {
            $0.direction = .left
            $0.addTarget(self, action: #selector(handleSwipe(_:)))
        }
        
//        rootView.addGestureRecognizer(rightSwipeGesture)
//        rootView.addGestureRecognizer(leftSwipeGesture)
    }
    
    private func target() {
        
    }
    
    private func delegate() {
    }
    
    //MARK: - Action Method
    
    @objc
    func detailListBtnTap() {
        print("Pop")
    }
    
    @objc
    func handleSwipe(_ sender: UISwipeGestureRecognizer) {
        if sender.direction == .right {
            print("오른쪽으로 스와이프 했습니다.")
        }
        
        else if sender.direction == .left {
            print("왼쪽으로 스와이프 했습니다.")
        }
    }
    
    
}
