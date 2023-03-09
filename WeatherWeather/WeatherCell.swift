//
//  WeatherCell.swift
//  WeatherWeather
//
//  Created by Ольга on 25.01.2023.
//

import UIKit

final class WeatherCell: UICollectionViewCell {
    //MARK: - IBOutlets
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var temperature: UILabel!
    @IBOutlet weak var humidity: UILabel!
    @IBOutlet private var backView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backView.layer.cornerRadius = 10
        backView.layer.borderColor = UIColor.black.cgColor
        backView.layer.borderWidth = 3
    }
}
