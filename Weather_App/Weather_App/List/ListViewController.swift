//
//  ViewController.swift
//  Weather_App
//
//  Created by 신지원 on 12/11/23.
//

import UIKit

import SnapKit
import Then

class ListViewController: UIViewController {
    
    // MARK: - Properties
    
    // MARK: - UI Components
    
    private let rootView = ListView()
    
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
        rootView.listTableView.delegate = self
        rootView.listTableView.dataSource = self
    }
}

extension ListViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 117.0 + 16.0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: ListTableViewHeader.identifier) as? ListTableViewHeader else { return UIView()}
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 169.0 - 16.0
    }
}

extension ListViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ListTableViewCell.identifier, for: indexPath) as? ListTableViewCell else { return UITableViewCell() }
        cell.delegate = self
        return cell
    }
}

extension ListViewController: ListTableViewCellDelegate {
    func listBtnTap(_ cell: UITableViewCell) {
        if let indexPath = rootView.listTableView.indexPath(for: cell) {
            print("\(indexPath.row)")
            
            let detailPageVC = DetailPageViewController()
            
            for index in 0..<5 {
                let detailVC = DetailViewController()
                detailVC.VCNum = index
                detailPageVC.VCList.append(detailVC)
            }
        
            detailPageVC.VCIndex = indexPath.row
            self.navigationController?.pushViewController(detailPageVC, animated: false)
            
        } else {
            print("Error")
        }
    }
}

