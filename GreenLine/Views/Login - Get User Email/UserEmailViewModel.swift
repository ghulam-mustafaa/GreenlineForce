//
//  UserEmailViewModel.swift
//  GreenLine
//
//  Created by EAPPLE on 07/09/2022.
//

class UserEmailViewModel {
    
    // MARK: - Instance Properties
    
    var email : String = ""
    
    func validateInput() -> ValidationStatus {
        if email.trim().isEmpty {
            return .invalid(message: "Email cannot be empty")
        } else if !email.trim().isValidEmail() {
            return .invalid(message: "Please enter a valid email")
        }
        return .valid
    }
}
