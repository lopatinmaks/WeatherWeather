//
//  HelloViewController.swift
//  WeatherWeather
//
//  Created by Ольга on 24.01.2023.
//

import UIKit

final class HelloViewController: UIViewController {
    //MARK: - IBOutlets
    @IBOutlet private var centerText: UILabel!
    @IBOutlet private var imageView: UIImageView!
    @IBOutlet weak var topTitleConstraint: NSLayoutConstraint!
    
    var label = UILabel()
    var box: UIView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        centerText.text = "Hello, World!"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        addBox()
    }
    
    private func addBox() {
        box.frame = CGRect(x: (Int(view.frame.width) - 50) / 2, y: Int(view.frame.height) - 200, width: 50, height: 50)
        box.backgroundColor = .blue
        
        view.addSubview(box)
        
         
    }
    
    //MARK: - @BActions
    
    @IBAction func addWord(_ sender: UIBarButtonItem) {
        centerText.text = (centerText.text ?? "") + " hello"
    }
    
    private let colors: [UIColor] = [.red, .blue, .black, .orange, .green]
    
    @IBAction func animate(_ sender: Any) {
        UIView.animate(withDuration: 2.0, delay: 0.0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.7) {
            self.box.frame.origin.x += 50
        } completion: { (result) in
            
        }

        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print(#function)
    }
}
