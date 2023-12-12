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
    private var weatherDummy: [Weathers] = []
    private var filteredWeatherData: [Weathers] = []
    private var isFiltering: Bool = false
    private var isSearching: Bool = false
    
    // MARK: - UI Components
    
    private let rootView = ListView()
    
    // MARK: - Life Cycle
    
    override func loadView() {
        self.view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getWeathers(cities: Cities)
        
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
        header.listWeatherSearchBar.delegate = self
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 88.0
    }
}

extension ListViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isFiltering ? filteredWeatherData.count : weatherDummy.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ListTableViewCell.identifier, for: indexPath) as? ListTableViewCell else { return UITableViewCell() }
        cell.delegate = self
        let weatherData = isFiltering ? filteredWeatherData[indexPath.row] : weatherDummy[indexPath.row]
        cell.dataBind(weatherData)
        return cell
    }
}

extension ListViewController: ListTableViewCellDelegate {
    func listBtnTap(_ cell: UITableViewCell) {
        guard weatherDummy.count == Cities.count else {
            print("데이터가 아직 로드되지 않았습니다.")
            return
        }
        
        if let indexPath = rootView.listTableView.indexPath(for: cell) {
            let detailPageVC = DetailPageViewController()
            for index in 0..<weatherDummy.count {
                let detailVC = DetailViewController()
                detailVC.VCNum = index
                detailPageVC.VCList.append(detailVC)
            }
            
            detailPageVC.weatherDummy = self.weatherDummy
            detailPageVC.initializePageViewController(with: indexPath.row)
            detailPageVC.detailBottomBar.detailPageController.currentPage = indexPath.row
            self.navigationController?.pushViewController(detailPageVC, animated: false)
            
        } else {
            print("Error")
        }
    }
}

extension ListViewController : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            isFiltering = false
            filteredWeatherData = []
            searchBar.showsCancelButton = false
        } else {
            isFiltering = true
            filteredWeatherData = weatherDummy.filter { $0.name.lowercased().contains(searchText.lowercased()) }
            searchBar.showsCancelButton = true
        }
        rootView.listTableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.searchTextField.text = ""
        searchBar.showsCancelButton = false
        isFiltering = false
        filteredWeatherData = []
        rootView.listTableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
    }
//    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
//    }
//
//    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
//    }
}

extension ListViewController {
    func getWeathers(cities : [String]) {
        var tempWeathers: [Weathers?] = Array(repeating: nil, count: cities.count)
        let dispatchGroup = DispatchGroup()
        
        for (index, city) in cities.enumerated() {
            dispatchGroup.enter()
            WeatherService.shared.getWeather(forCity: city) { weather, error in
                if let error = error {
                    print("Error: \(error)")
                } else if let weather = weather {
                    DispatchQueue.main.async { // 메인 스레드로 전환
                        tempWeathers[index] = weather
                    }
                    dispatchGroup.leave()
                }
            }
        }
        
        dispatchGroup.notify(queue: .main) {
            self.weatherDummy = tempWeathers.compactMap { $0 }
            self.loadData()
        }
    }
    
    func loadData() {
        rootView.listTableView.reloadData()
    }
}

