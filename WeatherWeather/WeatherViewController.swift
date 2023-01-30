//
//  WeatherViewController.swift
//  WeatherWeather
//
//  Created by Ольга on 25.01.2023.
//

import UIKit

final class WeatherViewController: UIViewController {
//MARK: - IBOutlet
    @IBOutlet private var collectionView: UICollectionView!
    
    private var weather = [
        WeatherData(temperature: 30, humidity: 0.2),
        WeatherData(temperature: 32, humidity: 0.3),
        WeatherData(temperature: 12, humidity: 0.4),
        WeatherData(temperature: 25, humidity: 0.6),
        WeatherData(temperature: 30, humidity: 0.2),
        WeatherData(temperature: 32, humidity: 0.3),
        WeatherData(temperature: 12, humidity: 0.4),
        WeatherData(temperature: 25, humidity: 0.6),
        WeatherData(temperature: 30, humidity: 0.2),
        WeatherData(temperature: 32, humidity: 0.3),
        WeatherData(temperature: 12, humidity: 0.4),
        WeatherData(temperature: 25, humidity: 0.6)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            
        layout.itemSize = CGSize(width: 100, height: 100)
        }
    }
}
//MARK: - UICollectionViewDataSource
extension WeatherViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return weather.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WeatherCell", for: indexPath) as? WeatherCell else { fatalError() }
        
        let data = weather[indexPath.row]
        
        cell.temperature.text = String(data.temperature)
        cell.humidity.text = String(data.humidity)
        
        return cell
    }
}
//MARK: - UICollectionViewDelegate
extension WeatherViewController: UICollectionViewDelegate {}
