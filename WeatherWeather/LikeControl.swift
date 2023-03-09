//
//  LikeControl.swift
//  WeatherWeather
//
//  Created by Ольга on 02.02.2023.
//

import UIKit

class LikeControl: UIControl {
    
    private var count: Int = 0
    
    private var countLabel = UILabel()
    private var imageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        countLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(imageView)
        addSubview(countLabel)
        
        let imageConstraints = [
            
            imageView.leftAnchor.constraint(equalTo: leftAnchor),
            imageView.rightAnchor.constraint(equalTo: countLabel.leftAnchor),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 20)
        ]
        
        let labelConstraints = [
            
            countLabel.rightAnchor.constraint(equalTo: rightAnchor),
            countLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ]
        
        NSLayoutConstraint.activate(labelConstraints + imageConstraints)
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(onHeartTapped(_:)))
        imageView.addGestureRecognizer(gesture)
        imageView.isUserInteractionEnabled = true
        updateView()
    }
    
    private func updateView() {
        countLabel.text = "\(count)"
        if isSelected {
            imageView.image = UIImage(systemName: "heart.fill")
        } else {
            imageView.image = UIImage(systemName: "heart")
        }
    }
    
    @objc func onHeartTapped(_ gesture: UITapGestureRecognizer) {
        isSelected != isSelected
        count += isSelected ? 1 : -1
        updateView()
        sendActions(for: .valueChanged)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
