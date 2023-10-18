//
//  ViewController.swift
//  Jiwon's Weather Forecast
//
//  Created by 신지원 on 2023/10/16.
//

import UIKit

import SnapKit
import Then

class ListViewController: UIViewController {
    
    // MARK: - Properties
    
    // MARK: - UI Components
    
    private let rootView = ListScrollView()
    
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
        rootView.listWeatherSearchBar.delegate = self
    }
    
    //MARK: - Action Method
    
}

// MARK: - UISearchBarDelegate
extension ListViewController: UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        print("cancel")
        rootView.listWeatherSearchBar.searchTextField.text = ""
        rootView.endEditing(true)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("눌렀다💛")
        rootView.endEditing(true)
        
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        rootView.listWeatherLabel.isHidden = true
        
        //이동 위치 구체적 설정 + 키보드 비동기처리 해야 함
        rootView.listScrollView.setContentOffset(CGPoint(x: 0 ,y: 80), animated: true)
        rootView.listWeatherSearchBar.showsCancelButton = true
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        rootView.listWeatherLabel.isHidden = false
        rootView.listScrollView.setContentOffset(CGPoint(x: 0 ,y: 0), animated: true)
        rootView.listWeatherSearchBar.showsCancelButton = false
    }
}
