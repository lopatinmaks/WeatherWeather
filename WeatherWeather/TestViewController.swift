//
//  TestViewController.swift
//  WeatherWeather
//
//  Created by Ольга on 30.01.2023.
//

import UIKit
import Alamofire

final class TestViewController: UIViewController {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //activityIndicator.stopAnimating()
//        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: DispatchWorkItem){
//            self.getWeatherWithURLSessionComponents()
//        }
        //getWeatherWithURLSessionComponents(city: "London")
        getWeatherWithAlamofire()
    }
    
    func getWeatherWithURLSession() {
        guard let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=Moscow&appid=d86496b67dfb6a70d0e2a10123dcceab&units=metric") else { return }
        let session = URLSession.shared
        let task = session.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                self.activityIndicator.stopAnimating()
            }
            
            if let data = data {
                let json = try? JSONSerialization.jsonObject(with: data, options: [])
                print(json)
            }
            
        }
        task.resume()
    }
    
    func getWeatherWithURLSessionComponents(city: String) {
        var components = URLComponents()
        components.scheme = "http"
        components.host = "api.openweathermap.org"
        components.path = "/data/2.5/weather"
        components.queryItems = [
            URLQueryItem(name: "q", value: "Moscow"),
            URLQueryItem(name: "appid", value: "d86496b67dfb6a70d0e2a10123dcceab")
        ]
        
        guard let url = components.url else { return }
        let session = URLSession.shared
        let task = session.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                self.activityIndicator.stopAnimating()
            }
            
            if let data = data {
                let json = try? JSONSerialization.jsonObject(with: data, options: [])
                print(json)
            }
            
        }
        task.resume()
    }
    
    func getWeatherWithAlamofire() {
        let urlPath = "http://api.openweathermap.org/data/2.5/weather?q=Moscow&appid=d86496b67dfb6a70d0e2a10123dcceab&units=metric"
        AF.request(urlPath).responseJSON { response in
            print(response.value)
        }
    }
}
