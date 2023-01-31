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
    @IBOutlet private var testView: TestView!
    @IBOutlet private var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        testView.configure()
    }
    //MARK: - @BActions
    @IBAction func addWord(_ sender: UIBarButtonItem) {
        centerText.text = (centerText.text ?? "") + " hello"
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print(#function)
    }
}
