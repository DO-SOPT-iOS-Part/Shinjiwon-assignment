//
//  DetailPageView.swift
//  Jiwon's Weather Forecast
//
//  Created by 신지원 on 10/27/23.
//

//import UIKit
//
//class DetailPageView: UIView {
//    
//    // MARK: - Properties
//    let dataNum = listData.count
//    
//    // MARK: - UI Components
//    var scrollView = UIScrollView()
//    
//    // MARK: - Life Cycle
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        
//        style()
//        hierarchy()
//        layout()
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    // MARK: - Custom Method
//    private func style() {
//        scrollView.do {
//            $0.isPagingEnabled = true
//        }
//        
//        for pageIndex in 0..<dataNum {
//            let page = DetailView()
//            page.frame = CGRect(x: CGFloat(pageIndex) * super.frame.width, y: 0, width: view.frame.width, height: view.frame.height)
//            page.backgroundColor = [UIColor.red, .blue, .green][pageIndex] // 페이지 색상 지정
//            scrollView.addSubview(page)
//        }
//    }
//    
//    private func hierarchy() {
//        view.addSubview(scrollView)
//    }
//    
//    private func layout() {
//        
//    }
//}
