//
//  WeatherViewController.swift
//  WeatherWeather
//
//  Created by Ольга on 25.01.2023.
//

import UIKit

protocol WeatherViewControllerDelegate: class {
    func updateCity( oldNmae: String, newName: String )
}

final class WeatherViewController: UIViewController {
//MARK: - IBOutlet
    @IBOutlet private var collectionView: UICollectionView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameField: UITextField!
    
    weak var delegate: WeatherViewControllerDelegate?
    
    var iconImage: UIImage?
    var name: String?
    lazy var service = WeatherAPIServices()
    
    var weather = [
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
        
        service.getWeather(city: name ?? "")
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        titleLabel.text = name
        nameField.text = name
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            
        layout.itemSize = CGSize(width: 100, height: 100)
        }
    }
    
    @IBAction func selectedDayUpdate(_ sender: Any) {
        weather = (0...20).map { _ in
            WeatherData(temperature: Int.random(in: -10...10), humidity: Double.random(in: 0.0...1.0))
        }
        collectionView.reloadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        guard let name = name else { return }
        delegate?.updateCity(oldNmae: name, newName: nameField.text ?? name)
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
