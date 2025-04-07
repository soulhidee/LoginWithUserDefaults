//
//  ViewController.swift
//  loginScreen
//
//  Created by Даниил on 07.04.2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var saveUsernameSwitch: UISwitch!
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTextField.isSecureTextEntry = true
        if let savedUsername = UserDefaults.standard.string(forKey: "username") {
            usernameTextField.text = savedUsername
        }
        
        if let savedPassword = UserDefaults.standard.string(forKey: "password") {
            passwordTextField.text = savedPassword
        }
        
        let isSwitchOn = UserDefaults.standard.bool(forKey: "saveUsernameSwitchState")
        saveUsernameSwitch.isOn = isSwitchOn
    }

    @IBAction func loginButtonTapped(_ sender: UIButton) {
        let username = usernameTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        
        if username.isEmpty || password.isEmpty {
            print("Please enter both username and password.")
            return
        }
        
        if saveUsernameSwitch.isOn {
            UserDefaults.standard.set(username, forKey: "username")
            UserDefaults.standard.set(password, forKey: "password")
        } else {
            UserDefaults.standard.removeObject(forKey: "username")
            UserDefaults.standard.removeObject(forKey: "password")
        }
        
        UserDefaults.standard.set(saveUsernameSwitch.isOn, forKey: "saveUsernameSwitchState")

        print("Login successful")
    }
    
    
    
    
    
}

