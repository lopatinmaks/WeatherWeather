//
//  TestView.swift
//  WeatherWeather
//
//  Created by Ольга on 30.01.2023.
//

import UIKit

@IBDesignable final class TestView: UIView {
    override class var layerClass: AnyClass {
        return CAShapeLayer.self
    }
    
    private let first = CAShapeLayer()
    private let second = CAShapeLayer()
    
    var shapeLayer: CAShapeLayer {
        return(layer as! CAShapeLayer)
    }
    
    func configure() {
        first.backgroundColor = UIColor.black.cgColor
        second.backgroundColor = UIColor.black.cgColor
        
        first.frame = CGRect(x: 100, y: 100, width: 4, height: 4)
        second.frame = CGRect(x: 100, y: 100, width: 4, height: 4)
        
        first.masksToBounds = true
        second.masksToBounds = true
        
        first.cornerRadius = 2
        second.cornerRadius = 2
        
        layer.addSublayer(first)
        layer.addSublayer(second)
    }
    
    func animate() {
        let scaleAnimation = CABasicAnimation(keyPath: "bounds.size.width")
        scaleAnimation.byValue = 16
        scaleAnimation.duration = 1
        scaleAnimation.fillMode = .forwards
        scaleAnimation.isRemovedOnCompletion = false
        
        let rotationLeft = CABasicAnimation(keyPath: "transform.rotation")
        rotationLeft.byValue = CGFloat.pi/4
        rotationLeft.duration = 1
        rotationLeft.beginTime = CACurrentMediaTime() + 1
        rotationLeft.fillMode = .both
        rotationLeft.isRemovedOnCompletion = false
        
        let rotationRight = CABasicAnimation(keyPath: "transform.rotation")
        rotationRight.byValue = -(CGFloat.pi/4)
        rotationRight.duration = 1
        rotationRight.beginTime = CACurrentMediaTime() + 1
        rotationRight.fillMode = .both
        rotationRight.isRemovedOnCompletion = false
        
        first.add(scaleAnimation, forKey: nil)
        first.add(rotationLeft, forKey: nil)
        
        second.add(scaleAnimation, forKey: nil)
        second.add(rotationRight, forKey: nil)
    }
}
