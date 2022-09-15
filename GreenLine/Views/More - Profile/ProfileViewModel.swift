//
//  ProfileViewModel.swift
//  GreenLine
//
//  Created by EAPPLE on 13/09/2022.
//

import Foundation

class ProfileViewModel {
    
    var repository = ProfileRepository()
    var firstName = ""
    var email = ""
    var phone = ""
    var lastName = ""
    var password = ""
    
    func updateProfile(success: @escaping () -> Void, failure: @escaping failureCompletionHandler) {
        repository.updateUserProfile(fname: firstName,
                                     lname: lastName,
                                     password: password,
                                     phone: phone,
                                     withCompletion: {
            (result) in
            switch result {
                case .success(_):
                    success()
                case .failure(let error):
                    failure(error)
            }
        })
    }
}
