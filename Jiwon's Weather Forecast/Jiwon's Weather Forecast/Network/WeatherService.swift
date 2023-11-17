//
//  WeatherService.swift
//  Jiwon's Weather Forecast
//
//  Created by 신지원 on 11/17/23.
//

import Foundation

class WeatherService {
    
    //보지마💛
    let apiKey = "9c7fa18b50b00954d1159672fb66a924"
    static let shared = WeatherService()
    
    func getWeather(forCity city: String, completion: @escaping (Weathers?, Error?) -> Void) {
        
        let apiUrl = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apiKey)&units=metric"
        guard let url = URL(string: apiUrl) else {
            completion(nil, nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(nil, error)
                return
            }
            
            guard let data = data else {
                completion(nil, nil)
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(Weathers.self, from: data)
//                print(decodedData)
                completion(decodedData, nil)
            } catch {
                completion(nil, error)
            }
        }
        
        task.resume()
    }
}
