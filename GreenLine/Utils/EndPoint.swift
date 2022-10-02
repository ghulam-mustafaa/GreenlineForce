//
//  EndPoint.swift
//  GreenLine
//
//  Created by EAPPLE on 07/09/2022.
//

import Foundation

enum Endpoint {
    static var login: URL? {
        URL(string: "Authenticate/login", relativeTo: Environment.baseUrl)
    }
    static var getUserProfile: URL? {
        URL(string: "User/GetProfileLite", relativeTo: Environment.baseUrl)
    }
    static var updateUserProfile: URL? {
        URL(string: "User/UpdateProfileMobile", relativeTo: Environment.baseUrl)
    }
    static var getAllShifts: URL? {
        URL(string: "Shift/GetAll", relativeTo: Environment.baseUrl)
    }
    static var getAbsencesQuota: URL? {
        URL(string: "Absence/GetQuota", relativeTo: Environment.baseUrl)
    }
    static var requestAbsence: URL? {
        URL(string: "Absence/RequestAbsence", relativeTo: Environment.baseUrl)
    }
    
}
