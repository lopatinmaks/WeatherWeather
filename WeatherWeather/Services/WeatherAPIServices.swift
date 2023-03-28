//
//  WeatherAPIServices.swift
//  WeatherWeather
//
//  Created by Ольга on 28.03.2023.
//

import Foundation
import Alamofire

class WeatherAPIServices {
    
    let baseUrl = "http://api.openweathermap.org/data/2.5/"
    let apiKey = "d86496b67dfb6a70d0e2a10123dcceab"
    
    func getWeather(city: String) {
        let path = "weather"
        let parameters: Parameters = [
            "q": city,
            "appid": apiKey
        ]
        let url = baseUrl + path
        
        AF.request(url, parameters: parameters).responseJSON { response in
            print(response.value ?? "NO JSON")
        }
    }
}
