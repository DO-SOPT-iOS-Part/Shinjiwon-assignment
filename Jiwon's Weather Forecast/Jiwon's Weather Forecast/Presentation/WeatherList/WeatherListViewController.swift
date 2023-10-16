//
//  ViewController.swift
//  Jiwon's Weather Forecast
//
//  Created by 신지원 on 2023/10/16.
//

import UIKit

import SnapKit
import Then

class WeatherListViewController: UIViewController {
    
    // MARK: - Properties
    
    // MARK: - UI Components
    
    private let rootView = WeatherListScrollView()
    
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
        rootView.scrollWeatherSearchBar.delegate = self
        rootView.scrollWeatherSearchBar.searchTextField.delegate = self
    }
    
    //MARK: - Action Method
    
}

// MARK: - UISearchBarDelegate
extension WeatherListViewController: UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        print("cancel")
        rootView.scrollWeatherSearchBar.searchTextField.text = ""
        rootView.endEditing(true)

    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("눌렀다💛")
        rootView.endEditing(true)
        
    }
}

extension WeatherListViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("💗")
        rootView.scrollWeatherLabel.isHidden = true
        rootView.scrollView.setContentOffset(CGPoint(x: 0 ,y: 80), animated: true)
        rootView.scrollWeatherSearchBar.showsCancelButton = true
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        rootView.scrollWeatherLabel.isHidden = false
        rootView.scrollView.setContentOffset(CGPoint(x: 0 ,y: 0), animated: true)
        rootView.scrollWeatherSearchBar.showsCancelButton = false
    }
}


