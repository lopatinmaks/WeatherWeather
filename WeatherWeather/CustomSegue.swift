//
//  CustomSegue.swift
//  WeatherWeather
//
//  Created by Ольга on 21.03.2023.
//

import UIKit

class CustomSegue: UIStoryboardSegue {
    override func perform() {
        guard let containerView = source.view.superview else { return }
        
        let containerViewFrame = containerView.frame
        let sourceViewTargetFrame = CGRect(x: 0, y: -containerViewFrame.height, width: source.view.frame.width, height: source.view.frame.height)
        let destinationViewTargetFrame = source.view.frame
        containerView.addSubview(destination.view)
        destination.view.frame = CGRect(x: 0, y: containerViewFrame.height, width: source.view.frame.width, height: source.view.frame.height)
        
        UIView.animate(withDuration: 0.5) {
            self.source.view.frame = sourceViewTargetFrame
            self.destination.view.frame = destinationViewTargetFrame
        } completion: { result in
            self.source.present(self.destination, animated: false)
        }

    }
}
