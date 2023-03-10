//
//  GradientView.swift
//  WeatherWeather
//
//  Created by Ольга on 09.03.2023.
//

import UIKit

@IBDesignable class GradientView: UIView {

    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    var gradientLayer: CAGradientLayer {
        return layer as! CAGradientLayer
    }
    
    @IBInspectable var startColor: UIColor = .white {
        didSet {
            updateColors()
        }
    }
    
    @IBInspectable var endColor: UIColor = .black {
        didSet {
            updateColors()
        }
    }
    
    @IBInspectable var startLocation: CGFloat = 0 {
        didSet {
            updateLocations()
        }
    }
    
    @IBInspectable var endLocation: CGFloat = 1 {
        didSet {
            updateLocations()
        }
    }
    
    @IBInspectable var startPoint: CGPoint = .zero {
        didSet {
            updateStartPoint()
        }
    }
    
    @IBInspectable var endPoint: CGPoint = .init(x: 0, y: 1) {
        didSet {
            updateEndPoint()
        }
    }
    
    private func updateColors() {
        
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
    }
    
    private func updateStartPoint() {
        gradientLayer.startPoint = startPoint
    }
    
    private func updateEndPoint() {
        gradientLayer.endPoint = endPoint
    }
    
    func updateLocations() {
        gradientLayer.locations = [startLocation as NSNumber, endLocation as NSNumber]
    }
}
