//
//  TestView.swift
//  WeatherWeather
//
//  Created by Ольга on 30.01.2023.
//

import UIKit

@IBDesignable final class TestView: UIView {
    
    @IBInspectable private var radius: CGFloat = 10 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable private var color: UIColor = .red {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable private var diameter: CGFloat {
        radius * 2
    }
    
    override class var layerClass:AnyClass {
        return CAShapeLayer.self
    }
    
    func configure() {
//       let gradienLayer = CAGradientLayer()
//
//        gradienLayer.colors = [UIColor.blue.cgColor, UIColor.purple.cgColor]
//        gradienLayer.locations = [NSNumber(value: 0), NSNumber(value: 1)]
//        gradienLayer.startPoint = CGPoint.zero
//        gradienLayer.endPoint = CGPoint(x: 0, y: 1)
//
//        layer.addSublayer(gradienLayer)
//        gradienLayer.frame = bounds
        
        transform = CGAffineTransform(rotationAngle: .pi / 4).concatenating(CGAffineTransform(scaleX: 0.3, y: 0.3))
         
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(onTap(_:)))
        
        addGestureRecognizer(recognizer)
    }
    
    @objc private func onTap(_ sender: UITapGestureRecognizer) {
        radius = CGFloat.random(in: 0.0...50.0)
        setNeedsDisplay()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        context.setFillColor(UIColor.red.cgColor)
        context.fill(CGRect(x: rect.midX - radius, y: rect.midY - radius, width: diameter, height: diameter))
    }
}
