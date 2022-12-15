//
//  SessionManager.swift
//  GreenLine
//
//  Created by EAPPLE on 07/09/2022.
//

import Foundation

class SessionManager {
    
    static let shared = SessionManager()
    
    private init() {
    }
    
    // MARK: Properties
    
    public var user: GreenlineUser?
    public var isUserLogin: Bool {
        return !UserDefaultsManager.accessToken.isEmpty
    }
    
    // MARK: - Public Methods
    
    public func loadSession(){
    }
    
    public func saveUser(user: GreenlineUser){
        self.user = user
        UserDefaultsManager.user = user.toJSON()
    }
    
    public func logout(){
        UserDefaultsManager.user = [:]
        UserDefaultsManager.accessToken = ""
        UserDefaultsManager.isRememberMeSelected = false
    }
    
    @objc
    func expireSession(){
        logout()
        let loginViewController = Utils.showLoginScreen()
    }
    
}
