//
//  LoginViewModel.swift
//  GreenLine
//
//  Created by EAPPLE on 07/09/2022.
//

import Foundation

typealias failureCompletionHandler = (_ error: GreenlineError) -> ()

class LoginViewModel {
    
    // MARK: - Instance Properties
    
    var email : String = ""
    var password : String = ""
    private var repository = LoginRepositry()
    
    // MARK: - Public Methods
    
    func loginButtonTapped(success: @escaping () -> Void, failure: @escaping failureCompletionHandler) {
        
    }
    
    func validateInput() -> ValidationStatus {
        if password.isEmpty {
            return .invalid(message: "Password must not be empty")
        } else if password.count < 6 {
            return .invalid(message: "Password must be greater than or equal to 6 characters")
        }
        return .valid
    }
    
    func loginUser(success: @escaping () -> Void, failure: @escaping failureCompletionHandler){
        repository.loginUser(withEmail: email , andPassword: password, withCompletion:  {
            (result) in
            switch result {
                case .success(let user):
                    UserDefaultsManager.accessToken = user.token ?? ""
                    UserDefaultsManager.accessTokenExpirationDate = user.expiration ?? ""
                    success()
                case .failure(let error):
                    failure(error)
            }
        })
    }
    
    func getUserProfile(success: @escaping () -> Void, failure: @escaping failureCompletionHandler) {
        repository.getUserProfile(withCompletion:  {
            (result) in
            switch result {
                case .success(let user):
                    SessionManager.shared.saveUser(user: user)
                    success()
                case .failure(let error):
                    failure(error)
            }
        })
    }
}
