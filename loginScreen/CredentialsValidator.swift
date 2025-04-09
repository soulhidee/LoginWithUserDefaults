import Foundation

class CredentialsValidator {
    
    let minLength: Int
    let maxLength: Int
    
    init(minLength: Int, maxLength: Int) {
        self.minLength = minLength
        self.maxLength = maxLength
    }
    
    func validate(username: String, password: String) -> String? {
        if username.count < minLength || username.count > maxLength {
            return "Username must be between \(minLength) and \(maxLength) characters."
        }
        if password.count < minLength || password.count > maxLength {
            return "Password must be between \(minLength) and \(maxLength) characters."
        }
        return nil
    }
}
