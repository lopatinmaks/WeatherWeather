//
//  LoginViewController.swift
//  WeatherWeather
//
//  Created by Ольга on 24.01.2023.
//

import UIKit

final class LoginViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet private var scrollView: UIScrollView!
    @IBOutlet private var loginTextField: UITextField!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet private var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Login VC loaded")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("Login VC did appear")
    }
    
    func animateLogin() {
        let fadeInAnimation = CABasicAnimation(keyPath: "opacity")
        fadeInAnimation.fromValue = 0
        fadeInAnimation.toValue = 1
        fadeInAnimation.duration = 2.0
        fadeInAnimation.beginTime = CACurrentMediaTime() + 1
        fadeInAnimation.fillMode = .backwards
        
        loginLabel.layer.add(fadeInAnimation, forKey: nil)
    }
    
    func animatedPasswordField() {
        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")
        scaleAnimation.fromValue = 0
        scaleAnimation.toValue = 1
        scaleAnimation.duration = 2.0
        scaleAnimation.beginTime = CACurrentMediaTime() + 1
        scaleAnimation.fillMode = .backwards
        
        passwordTextField.layer.add(scaleAnimation, forKey: nil)
    }
    
    func animateLoginField() {
        self.loginTextField.transform = CGAffineTransform(translationX: -500, y: 0)
        UIView.animate(withDuration: 1.0) {
            self.loginTextField.transform = .identity
        }
    }
    
    func animateWrongPassword() {
        UIView.animate(withDuration: 0.6, delay: 0.0, usingSpringWithDamping: 0.1, initialSpringVelocity: 0.1, options: [.autoreverse]) {
            self.passwordTextField.frame.origin.x += 1
            self.passwordTextField.frame.origin.y += 1
        } completion: { (result) in
            self.passwordTextField.layer.borderColor = UIColor.red.cgColor
            self.passwordTextField.layer.borderWidth = 1.0
            self.passwordTextField.frame.origin.x -= 1
            self.passwordTextField.frame.origin.y -= 1
        }

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Login will appear")
            
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShown(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
            
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
            
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        scrollView.addGestureRecognizer(tapGesture)
        
        animateLogin()
        animateLoginField()
        animatedPasswordField()
    }
        
    @objc private func keyboardWillShown(notification: Notification) {
        let info = notification.userInfo as? NSDictionary
        let kbSize = (info?.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as? NSValue)?.cgRectValue.size
            
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize?.height ?? 0.0, right: 0.0)
            
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }
        
    @objc private func keyboardWillHide(notification: Notification) {
        scrollView.contentInset = UIEdgeInsets.zero
        scrollView.scrollIndicatorInsets = UIEdgeInsets.zero
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print(#function)
    }
        
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("Login VC will disappear")
            
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
    }
        
    @objc private func hideKeyboard() {
        scrollView.endEditing(true)
    }
    
    private func checkLoginInfo() -> Bool {
        guard let loginText = loginTextField.text,
              let passwordText = passwordTextField.text else { return false }
        
        if loginText == "admin", passwordText == "12345" {
            print("Успешно!")
            return true
        } else {
            print("Попробуй еще раз!")
            return false
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        if identifier == "loginSegue" {
            if checkLoginInfo() {
                return true
            } else {
                showLoginError()
                return false
            }
        }
        return true
    }
    
    private func showLoginError() {
        animateWrongPassword()
//        let alert = UIAlertController(title: "Ошибка", message: "Логин и/или пароль не верны!", preferredStyle: .alert)
//        let action = UIAlertAction(title: "OK", style: .default)
//
//        alert.addAction(action)
//        present(alert, animated: true)
    }
    
    @IBAction func liginTapped(_ sender: UIButton) {
        guard let helloVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "helloVC") as? HelloViewController else { return }
        helloVC.modalPresentationStyle = .fullScreen
        
        present(helloVC, animated: true)
    }
}
