//
//  UserDefaultsManager.swift
//  GreenLine
//
//  Created by EAPPLE on 07/09/2022.
//

import Foundation

struct UserDefaultsManager {
    
    @propertyWrapper
    struct UserDefault<T> {
        let key: String
        let defaultValue: T
        init(_ key: String, defaultValue: T) {
            self.key = key
            self.defaultValue = defaultValue
        }
        
        var wrappedValue: T {
            get {
                return UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
            }
            set {
                UserDefaults.standard.set(newValue, forKey: key)
            }
        }
    }
    
}

extension UserDefaultsManager {
    
    @UserDefault("access_token", defaultValue: "")
    static var accessToken: String
    
    @UserDefault("is_remember_me_selected", defaultValue: false)
    static var isRememberMeSelected: Bool
    
    @UserDefault("token_expiration", defaultValue: "")
    static var accessTokenExpirationDate: String
    
    @UserDefault("user", defaultValue: [:])
    static var user: [String: Any]
}
