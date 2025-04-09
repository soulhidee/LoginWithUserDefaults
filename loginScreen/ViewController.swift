import UIKit

final class ViewController: UIViewController {
    
    // MARK: - Keys
    enum Keys: String {
        case username
        case password
        case saveUsernameSwitchState
    }
    
    // MARK: - Properties
    private let storage: UserDefaults = .standard
    
    // MARK: - Outlets
    @IBOutlet var saveUsernameSwitch: UISwitch!
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTextField.isSecureTextEntry = true
        loadSavedCredentials()
    }
    
    // MARK: - Private Methods
    private func loadSavedCredentials() {
        if let savedUsername = storage.string(forKey: Keys.username.rawValue) {
            usernameTextField.text = savedUsername
        }
        
        if let savedPassword = storage.string(forKey: Keys.password.rawValue) {
            passwordTextField.text = savedPassword
        }
        
        let isSwitchOn = storage.bool(forKey: Keys.saveUsernameSwitchState.rawValue)
        saveUsernameSwitch.isOn = isSwitchOn
    }
    
    // MARK: - Actions
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        let username = usernameTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        
        if username.isEmpty || password.isEmpty {
            print("Please enter both username and password.")
            return
        }
        
        if saveUsernameSwitch.isOn {
            storage.set(username, forKey: Keys.username.rawValue)
            storage.set(password, forKey: Keys.password.rawValue)
        } else {
            storage.removeObject(forKey: Keys.username.rawValue)
            storage.removeObject(forKey: Keys.password.rawValue)
        }
        
        storage.set(saveUsernameSwitch.isOn, forKey: Keys.saveUsernameSwitchState.rawValue)
        
        print("Login successful")
    }
}

