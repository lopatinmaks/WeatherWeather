//
//  GradientView.swift
//  WeatherWeather
//
//  Created by Ольга on 31.01.2023.
//

import UIKit

@IBDesignable final class GradientView: UIView {
    
    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    private var gradientLayer: CAGradientLayer {
        return layer as! CAGradientLayer
    }
    
    @IBInspectable private var startColor: UIColor = .white {
        didSet {
            updateColors()
        }
    }
    
    @IBInspectable private var endColor: UIColor = .black {
        didSet {
            updateColors()
        }
    }
    
    @IBInspectable private var startLocation: CGFloat = 0.0 {
        didSet {
            updateLocations()
        }
    }
    
    @IBInspectable private var endLocation: CGFloat = 1.0 {
        didSet {
            updateLocations()
        }
    }
    
    @IBInspectable private var startPoint: CGPoint = .zero {
        didSet {
            updateStartPoint()
        }
    }
    
    @IBInspectable private var endPoint: CGPoint = .init(x: 0.0, y: 1.0) {
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
    
    private func updateLocations() {
        gradientLayer.locations = [startLocation as NSNumber, endLocation as NSNumber]
    }
}
