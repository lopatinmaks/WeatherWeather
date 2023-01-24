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
    @IBOutlet private var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Login VC loaded")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("Login VC did appear")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Login will appear")
            
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShown(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
            
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
            
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        scrollView.addGestureRecognizer(tapGesture)
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
        let alert = UIAlertController(title: "Ошибка", message: "Логин и/или пароль не верны!", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    @IBAction func liginTapped(_ sender: UIButton) {
        guard let helloVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "helloVC") as? HelloViewController else { return }
        helloVC.modalPresentationStyle = .fullScreen
        
        present(helloVC, animated: true)
    }
}
