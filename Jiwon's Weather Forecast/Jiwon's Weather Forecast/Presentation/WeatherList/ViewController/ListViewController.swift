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
    private var weatherDummy: [Weathers] = []
    
    // MARK: - UI Components
    private let rootView = ListView()
    public var detailPageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    lazy var detailVCs: [DetailViewController] = []
    
    func getWeathers(cities : [String]) {
        for i in cities {
            WeatherService.shared.getWeather(forCity: i) { weather, error in
                if let error = error {
                    print("Error: \(error)")
                } else if let weather = weather {
                    DispatchQueue.main.async { // 메인 스레드로 전환
                        self.weatherDummy.append(weather)
                        self.loadData()
                    }
                }
            }
        }
    }
    
    func loadData() {
        rootView.listTableView.reloadData()
    }
    
    // MARK: - Life Cycle
    override func loadView() {
        self.view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let detailVC = getDetailVC(withIndex: 0)
        detailPageViewController.setViewControllers([detailVC], direction: .forward, animated: true, completion: nil)
        
        self.addChild(detailPageViewController)
//        self.view.addSubview(detailPageViewController.view)
        detailPageViewController.didMove(toParent: self)
        
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
        detailPageViewController.dataSource = self
        detailPageViewController.delegate = self
        rootView.listTableView.delegate = self
        rootView.listTableView.dataSource = self
        //        ListTable
    }
    
    func getDetailVC(withIndex index: Int) -> DetailViewController {
        let detailVC = DetailViewController()
        detailVC.index = index
        print("🥳\(index)")
        return detailVC
    }
    
    //MARK: - Action Method
    
    @objc
    private func buttonTap(_ sender: UIButton) {
        let index = sender.tag
        let detailVC = getDetailVC(withIndex : index)
        detailPageViewController.setViewControllers([detailVC], direction: .forward, animated: true, completion: nil)
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
        return weatherDummy.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ListTableViewCell.cellIdentifier, for: indexPath) as? ListTableViewCell else { return UITableViewCell() }
        cell.dataBind(weatherDummy[indexPath.row])
        
        return cell
    }
}

extension ListViewController: ListTableViewCellDelegate {
    func listBtnTap(cell: UITableViewCell) {
        
        print("💖")
        
//        if let indexPath = rootView.listTableView.indexPath(for: cell) {
//            // 여기서 indexPath를 사용하여 필요한 작업을 수행합니다.
//            print("Button tapped in cell at section \(indexPath.section), row \(indexPath.row)")
//        }
        
        //        let detailVC = DetailViewController()
        //        detailVC.weatherDummy = self.weatherDummy
        //        detailVC.detailTag = tag
        //        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension ListViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let currentIndex = detailVCs.firstIndex(of: viewController as! DetailViewController), currentIndex > 0 {
            return detailVCs[currentIndex - 1]
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let currentIndex = detailVCs.firstIndex(of: viewController as! DetailViewController), currentIndex < detailVCs.count - 1 {
            return detailVCs[currentIndex + 1]
        }
        return nil
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
