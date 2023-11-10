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
    
    //MARK: - Action Method
    @objc
    func listBtnTap(_ sender: UIButton) {
        let tag = sender.tag
        print("listTap with number: \(tag)")
        
//        let detailVC = DetailViewController()
//        detailVC.rootView.detailInfoView.detailWeatherLabel.text = listData[tag].weather
//        detailVC.rootView.detailInfoView.detailHighTemLabel.text = "최고:" + listData[tag].highTem + "°"
//        detailVC.rootView.detailInfoView.detailLowTemLabel.text = "최저:" + listData[tag].lowTem + "°"
//        detailVC.rootView.detailInfoView.detailCurrentTemLabel.text = listData[tag].currentTem + "°"
//        detailVC.rootView.detailInfoView.detailPlaceLabel.text = listData[tag].place
//        
//        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension ListViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 117.0 + 16.0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: ListHeaderView.cellIdentifier) as? ListHeaderView else { return UIView()}
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 169.0 - 16.0
    }
}

extension ListViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ListTableViewCell.cellIdentifier, for: indexPath) as? ListTableViewCell else { return UITableViewCell() }
        cell.dataBind(tag: indexPath.row)
        
        return cell
    }
}

//// MARK: - UISearchBarDelegate
//extension ListViewController: UISearchBarDelegate {
//    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
//        print("cancel")
//        rootView.listWeatherSearchBar.searchTextField.text = ""
//        rootView.endEditing(true)
//    }
//
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        print("눌렀다💛")
//        rootView.endEditing(true)
//
//    }
//
//    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
//        rootView.listWeatherLabel.isHidden = true
//
//        //이동 위치 구체적 설정 + 키보드 비동기처리 해야 함
//        rootView.listScrollView.setContentOffset(CGPoint(x: 0 ,y: 80), animated: true)
//        rootView.listWeatherSearchBar.showsCancelButton = true
//    }
//
//    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
//        rootView.listWeatherLabel.isHidden = false
//        rootView.listScrollView.setContentOffset(CGPoint(x: 0 ,y: 0), animated: true)
//        rootView.listWeatherSearchBar.showsCancelButton = false
//    }
//
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        if searchText.isEmpty {
//
//        }
//        else {
//            var filter = listData.filter {$0.place.lowercased().contains(searchText.lowercased())}
//            print("\(filter)💗")
//
//            rootView.listStackView.arrangedSubviews.forEach {
//                rootView.listStackView.removeArrangedSubview($0)
//                rootView.listStackView.removeFromSuperview()
//            }
//
//            var i = 0
//            for reloadList in filter {
//                let reloadButton = ListBaseButton()
//                reloadButton.do {
//                    $0.placeLabel.text = listData[i].place
//                    $0.timeLabel.text = listData[i].time
//                    $0.weatherLabel.text = listData[i].weather
//                    $0.currentTemLabel.text = listData[i].currentTem + "°"
//                    $0.highTemLabel.text = "최고:" + listData[i].highTem + "°"
//                    $0.lowTemLabel.text = "최저:" + listData[i].lowTem + "°"
//                    $0.tag = i
//
//                    rootView.listStackView.addArrangedSubview(reloadButton)
//                }
//                i = i+1
//            }
//            rootView.listScrollView.reloadInputViews()
//        }
//    }
//}
