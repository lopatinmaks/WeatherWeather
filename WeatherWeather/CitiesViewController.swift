//
//  CitiesViewController.swift
//  WeatherWeather
//
//  Created by Ольга on 25.01.2023.
//

import UIKit

final class CitiesViewController: UIViewController {
    //MARK: - IBOutlet
    @IBOutlet private var tableView: UITableView!
    
    private var cities = [
        "Москва",
        "Уфа",
        "Пермь",
        "Тверь",
        "Мурманск",
        "Ростов",
        "Владивосток",
        "Владимир",
        "Ижевск",
        "Сарапул",
        "Екатеринбург",
        "Нижний Новгород",
        "Анадырь",
        "Якутск",
        "Пенза",
        "Нижний Тагил",
        "Краснодар",
        "Петрозаводск",
        "Калининград"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
 
    //MARK: - IBAction
    @IBAction func addCity(_ sender: Any) {
        
        let alert = UIAlertController(title: "Добавить город", message: nil, preferredStyle: .alert)
        alert.addTextField { (textfield) in
            textfield.placeholder = "Название"
        }

        let action = UIAlertAction(title: "OK", style: .default) { [weak self, weak alert]
            (action) in
            guard let firstText = alert?.textFields?.first?.text else { return }
            self?.addCity(name: firstText)
        }

        alert.addAction(action)

        present(alert, animated: true)
    }
    
    private func addCity(name: String) {
        guard !name.isEmpty else { return }
        cities.insert(name, at: 0)
        tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if segue.identifier == "weatherSegue",
            let cell = sender as? CityCell,
           let destinayion = segue.destination as? WeatherViewController {
            
            destinayion.name = cell.titleLabel.text
        }
    }
}
//MARK: - UITableViewDataSource
extension CitiesViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cityCell", for: indexPath) as? CityCell else { fatalError() }

        cell.titleLabel.text = cities[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            cities.remove(at: indexPath.row)

            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
//MARK: - UITableViewDelegate
extension CitiesViewController: UITableViewDelegate {}
