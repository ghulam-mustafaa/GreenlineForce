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
//        NotificationCenter.default.addObserver(
//            self,
//            selector: #selector(expireSession),
//            name: .sessionExpired,
//            object: nil
//        )
    }
    
    // MARK: Properties
    
//    public var user: LevelUpUser?
    public var isUserLogin: Bool {
        return !UserDefaultsManager.accessToken.isEmpty
    }
    
    // MARK: - Public Methods
    
    public func loadSession(){
//        self.user = LevelUpUser(JSON: UserDefaultsManager.user)
//        guard let _ =  self.user?.accessToken else {
//            self.user = nil
//            return
//        }
    }
    
//    public func saveUser(user: LevelUpUser){
//        self.user = user
//        UserDefaultsManager.user = user.toJSON()
//    }
    
//    public func updateUser(){
//        UserDefaultsManager.user = user?.toJSON() ?? [:]
//    }
    
    public func logout(){
        UserDefaultsManager.user = [:]
        UserDefaultsManager.accessToken = ""
        UserDefaultsManager.isRememberMeSelected = false
    }
    
    @objc
    func expireSession(){
//        GoalsRepository.goalsPlan = nil
//        GoalsRepository.goalsProgress = nil
        logout()
        let loginViewController = Utils.showLoginScreen()
    }
    
}
