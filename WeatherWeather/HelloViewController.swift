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
    
    let interactiveTransition = InteractiveTransition()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        centerText.text = "Hello, World!"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    //MARK: - @BActions
    
    @IBAction func addWord(_ sender: UIBarButtonItem) {
        centerText.text = (centerText.text ?? "") + " hello"
    }
    
    @IBAction func animate(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "helloVC2") else { return }
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
       present(vc, animated: true)
    }
}

extension HelloViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
            return PushAnimator()
        }
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return PopAnimator()
    }


extension HelloViewController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if operation == .pop {
            if navigationController.viewControllers.first != toVC {
                interactiveTransition.viewController = toVC
            }
            return PopAnimator()
        } else {
            interactiveTransition.viewController = toVC
            return PushAnimator()
        }
    }
    
    func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interactiveTransition.hasStarted ? interactiveTransition : nil
    }
}
