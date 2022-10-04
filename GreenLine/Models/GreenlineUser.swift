//
//  GreenlineUser.swift
//  GreenLine
//
//  Created by EAPPLE on 10/09/2022.
//

import ObjectMapper

class GreenlineUser: Mappable {
    
    var email: String?
    var status: Bool?
    var firstName: String?
    var phoneNumber: String?
    var emergencyContact: EmergencyContact?
    var lastName: String?
    var userId: Int?
    var carAccess: Bool?
    var gender: String?
    var drivingLiscense: Bool?
    var mobileNumber: String?
    var doB: String?
    var profilePicture: String?
    var profilePictureUrl: String?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        email <- map["Email"]
        status <- map["status"]
        firstName <- map["FirstName"]
        phoneNumber <- map["PhoneNumber"]
        emergencyContact <- map["EmergencyContact"]
        lastName <- map["LastName"]
        userId <- map["UserId"]
        carAccess <- map["CarAccess"]
        gender <- map["Gender"]
        drivingLiscense <- map["DrivingLiscense"]
        mobileNumber <- map["MobileNumber"]
        doB <- map["DoB"]
        profilePicture <- map["ProfilePicture"]
        profilePictureUrl <- map["ProfilePitureUrl"]
    }
}

class EmergencyContact: Mappable {
    
    var relation: String?
    var phone: String?
    var name: String?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        relation <- map["Relation"]
        phone <- map["Phone"]
        name <- map["Name"]
    }
}
