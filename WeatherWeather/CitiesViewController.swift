//
//  CitiesViewController.swift
//  WeatherWeather
//
//  Created by Ольга on 25.01.2023.
//

import UIKit

class SectionHeader: UITableViewHeaderFooterView {
    
}

final class CitiesViewController: UIViewController {
    
    //MARK: - IBOutlet
    @IBOutlet private var tableView: UITableView!
    
    private var cities = [
        [
        "Москва",
        "Уфа",
        "Пермь",
        "Тверь",
        "Екатеринбург",
        "Нижний Новгород"
        ],
        [
        "Мурманск",
        "Ростов",
        "Владивосток",
        "Владимир",
        "Ижевск",
        "Сарапул"
        ],
        [
        "Анадырь",
        "Якутск",
        "Пенза",
        "Нижний Тагил",
        "Краснодар",
        "Петрозаводск",
        "Калининград"
        ]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UINib(nibName: "SectionHeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "header")
        
    }
    
    @IBAction func editTapped(_ sender: Any) {
        tableView.setEditing(!tableView.isEditing, animated: true)
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
//        cities.insert(name, at: 0)
//        tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if segue.identifier == "weatherSegue",
           let cell = sender as? CityCell,
           let destiantion = segue.destination as? WeatherViewController {
            
            destiantion.iconImage = cell.imageView?.image
            destiantion.name = cell.textLabel?.text
        }
    }
}
//MARK: - UITableViewDataSource
extension CitiesViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return cities.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities[section].count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let name = String(cities[section].compactMap{ $0.first })
        guard let header = tableView.dequeueReusableCell(withIdentifier: "header")as? SectionHeaderView else { return UIView() }
        
        header.label.text = name
        return header
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cityCell", for: indexPath) as? CityCell else { fatalError() }
        
        cell.imageView?.image = UIImage(named: "images")
        cell.textLabel?.text = cities[indexPath.section][indexPath.row]
        cell.detailTextLabel?.text = "город"
        
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
extension CitiesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "weatherVC") as? WeatherViewController else { return }
        let index = indexPath.row
        let cityName = cities[indexPath.section][index]
        
                vc.iconImage = UIImage(named: "images")
                vc.name = cityName
                //vc.delegate = self
                vc.weather = (0...50).map { _ in
                    WeatherData(temperature: Int.random(in: 0...30), humidity: Double.random(in: 0.0...1.0))
        
                }
                navigationController?.pushViewController(vc, animated: true)
            }
    }
    
    //extension CitiesViewController: WeatherViewControllerDelegate {
    //    func updateCity(oldNmae: String, newName: String) {
    ////        if let index = cities.firstIndex(of: oldNmae) {
    ////            cities[index] = newName
    ////            tableView.reloadData()
    ////        }
    //    }
    //}

