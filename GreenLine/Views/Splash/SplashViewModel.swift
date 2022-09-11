//
//  SplashViewModel.swift
//  GreenLine
//
//  Created by EAPPLE on 11/09/2022.
//

import Foundation

class SplashViewModel {
    
    private var repository = LoginRepositry()
    
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
