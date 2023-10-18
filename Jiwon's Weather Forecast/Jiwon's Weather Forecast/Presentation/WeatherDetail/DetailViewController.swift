//
//  WeatherDetailViewController.swift
//  Jiwon's Weather Forecast
//
//  Created by 신지원 on 10/18/23.
//

import UIKit

class DetailViewController: UIViewController {

    // MARK: - Properties
    
    // MARK: - UI Components
    
    private let rootView = DetailView()
    
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
    }
    
    //MARK: - Action Method
    
}
