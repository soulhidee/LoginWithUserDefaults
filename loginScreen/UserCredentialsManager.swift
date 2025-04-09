import Foundation

struct UserCredentialsManager {
    private let storage: UserDefaults
    
    init(storage: UserDefaults) {
        self.storage = storage
    }
    
    enum Keys: String {
        case username
        case password
        case saveUsernameSwitchState
    }
    
    var isSwitchOn: Bool {
        get { storage.bool(forKey: Keys.saveUsernameSwitchState.rawValue) }
        set { storage.set(newValue, forKey: Keys.saveUsernameSwitchState.rawValue) }
    }
    
    var username: String? {
        get { storage.string(forKey: Keys.username.rawValue) }
        set {
            if let newValue = newValue {
                storage.set(newValue, forKey: Keys.username.rawValue)
            } else {
                storage.removeObject(forKey: Keys.username.rawValue)
            }
        }
    }
    
    var password: String? {
        get { storage.string(forKey: Keys.password.rawValue) }
        set {
            if let newValue = newValue {
                storage.set(newValue, forKey: Keys.password.rawValue)
            } else {
                storage.removeObject(forKey: Keys.password.rawValue)
            }
        }
    }
}

