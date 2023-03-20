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
        box.backgroundColor = .white
        
        view.addSubview(box)
        
        box.isUserInteractionEnabled = true
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(onPan(_ :)))
        box.addGestureRecognizer(panGesture)
    }
    
    //MARK: - @BActions
    
    @IBAction func addWord(_ sender: UIBarButtonItem) {
        centerText.text = (centerText.text ?? "") + " hello"
    }
    
    private let colors: [UIColor] = [.red, .blue, .black, .orange, .green]
    
    private var animator: UIViewPropertyAnimator?
    
    @objc func onPan(_ recognizer: UIPanGestureRecognizer) {
        switch recognizer.state {
        case .began:
            animator = UIViewPropertyAnimator(duration: 0.5, curve: .easeInOut) {
                self.box.transform = .init(translationX: 0, y: 100)
            }
            animator?.pauseAnimation()
        case .changed:
            let translation = recognizer.translation(in: view)
            animator?.fractionComplete = translation.y / 100
        case .ended:
            animator?.stopAnimation(true)
            animator?.addAnimations {
                self.box.transform = .identity
            }
            animator?.startAnimation()
        default:
            return
        }
    }
    
    @IBAction func animate(_ sender: Any) {
        let animator = UIViewPropertyAnimator(duration: 0.5, curve: .linear) {
            self.box.frame = self.box.frame.offsetBy(dx: 0, dy: -100)
        }
        animator.startAnimation()
    }
        
    override func viewDidDisappear(_ animated: Bool) {
            super.viewDidDisappear(animated)
            print(#function)
        }
}
