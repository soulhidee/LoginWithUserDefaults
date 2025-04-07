import UIKit

class ViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet var saveUsernameSwitch: UISwitch!
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup password field to show secure text
        passwordTextField.isSecureTextEntry = true
        
        // Load saved username and password from UserDefaults
        loadSavedCredentials()
    }

    // MARK: - Helper Methods
    private func loadSavedCredentials() {
        if let savedUsername = UserDefaults.standard.string(forKey: "username") {
            usernameTextField.text = savedUsername
        }
        
        if let savedPassword = UserDefaults.standard.string(forKey: "password") {
            passwordTextField.text = savedPassword
        }
        
        let isSwitchOn = UserDefaults.standard.bool(forKey: "saveUsernameSwitchState")
        saveUsernameSwitch.isOn = isSwitchOn
    }
    
    // MARK: - Actions
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        let username = usernameTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        
        // Validate input fields
        if username.isEmpty || password.isEmpty {
            print("Please enter both username and password.")
            return
        }
        
        // Save or remove username and password based on the switch state
        if saveUsernameSwitch.isOn {
            UserDefaults.standard.set(username, forKey: "username")
            UserDefaults.standard.set(password, forKey: "password")
        } else {
            UserDefaults.standard.removeObject(forKey: "username")
            UserDefaults.standard.removeObject(forKey: "password")
        }
        
        // Save the state of the switch for future app launches
        UserDefaults.standard.set(saveUsernameSwitch.isOn, forKey: "saveUsernameSwitchState")

        print("Login successful")
    }
}
