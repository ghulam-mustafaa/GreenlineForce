//
//  ProfileViewModel.swift
//  GreenLine
//
//  Created by EAPPLE on 13/09/2022.
//

import Foundation

class ProfileViewModel {
    
    var repository = ProfileRepository()
    var loginRepository = LoginRepositry()
    var firstName = ""
    var email = ""
    var phone = ""
    var lastName = ""
    var password = ""
    var mobile = ""
    var birthdate = ""
    var gender = ""
    var emergencyContactName = ""
    var emergencyContactPhone = ""
    var emergencyContactRelation = ""
    var carAccess = false
    var drivingStatus = false
    
    func getUserProfile(success: @escaping () -> Void, failure: @escaping failureCompletionHandler) {
        loginRepository.getUserProfile(withCompletion:  {
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
    
    func populateProfileData() {
        let user = SessionManager.shared.user
        firstName = user?.firstName ?? ""
        lastName = user?.lastName ?? ""
        email = user?.email ?? ""
        phone = user?.phoneNumber ?? ""
        mobile = user?.mobileNumber ?? ""
        birthdate = user?.doB ?? ""
        gender = user?.gender ?? ""
        emergencyContactName = user?.emergencyContact?.name ?? ""
        emergencyContactPhone = user?.emergencyContact?.phone ?? ""
        emergencyContactRelation = user?.emergencyContact?.relation ?? ""
        carAccess = user?.carAccess ?? false
        drivingStatus = user?.drivingLiscense ?? false
    }
    
    func updateProfile(success: @escaping () -> Void, failure: @escaping failureCompletionHandler) {
        repository.updateUserProfile(fname: firstName, lname: lastName, phone: phone, mobile: mobile, birthday: birthdate, gender: gender, ecName: emergencyContactName, ecPhone: emergencyContactPhone, ecRelation: emergencyContactRelation, carAccess: carAccess, drivingStatus: drivingStatus, withCompletion: {
            (result) in
            switch result {
                case .success(_):
                    success()
                case .failure(let error):
                    failure(error)
            }
        })
    }
    
    func uploadImage(with data: Data, success: @escaping () -> Void, failure: @escaping failureCompletionHandler) {
        repository.uploadImage(with: data, withCompletion: {
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
