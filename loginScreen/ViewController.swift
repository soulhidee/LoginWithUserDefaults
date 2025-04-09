import UIKit

final class ViewController: UIViewController {

    // MARK: - Properties
    private var credentialsManager = UserCredentialsManager(storage: .standard)
    
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
        saveUsernameSwitch.isOn = credentialsManager.isSwitchOn
        usernameTextField.text = credentialsManager.username
        passwordTextField.text = credentialsManager.password
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
    
    // MARK: - Actions
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        let username = usernameTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        
        guard !username.isEmpty, !password.isEmpty else {
            showAlert(title: "Missing Information", message: "Please enter both username and password.")
            return
        }
        
        if saveUsernameSwitch.isOn {
            credentialsManager.username = username
            credentialsManager.password = password
        } else {
            credentialsManager.username = nil
            credentialsManager.password = nil
        }
        
        credentialsManager.isSwitchOn = saveUsernameSwitch.isOn
        
        showAlert(title: "Success", message: "Login successful!")
    }
}

