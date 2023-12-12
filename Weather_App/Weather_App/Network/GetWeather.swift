//
//  GetWeather.swift
//  Weather_App
//
//  Created by 신지원 on 12/12/23.
//

import UIKit

class GetWeather {
    func getWeathers(cities : [String], view : UIView) {
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
