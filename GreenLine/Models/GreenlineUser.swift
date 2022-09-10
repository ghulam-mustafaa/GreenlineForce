//
//  GreenlineUser.swift
//  GreenLine
//
//  Created by EAPPLE on 10/09/2022.
//

import ObjectMapper

class GreenlineUser: Mappable {
    
    var password: String?
    var lastName: String?
    var departments: [Departments]?
    var status: Int?
    var createdOn: String?
    var updatedOn: String?
    var profilePictureCompressed: String?
    var positions: [Positions]?
    var name: String?
    var createdBy: Int?
    var phone: String?
    var id: Int?
    var isEnable: Bool?
    var profilePicture: String?
    var type: Int?
    var firstName: String?
    var email: String?
    var contractDetails: ContractDetails?
    var userRole: Int?
    var creator: Any?
    var updatedBy: Int?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        password <- map["Password"]
        lastName <- map["LastName"]
        departments <- map["Departments"]
        status <- map["Status"]
        createdOn <- map["CreatedOn"]
        updatedOn <- map["UpdatedOn"]
        profilePictureCompressed <- map["ProfilePictureCompressed"]
        positions <- map["Positions"]
        name <- map["Name"]
        createdBy <- map["CreatedBy"]
        phone <- map["Phone"]
        id <- map["Id"]
        isEnable <- map["IsEnable"]
        profilePicture <- map["ProfilePicture"]
        type <- map["Type"]
        firstName <- map["FirstName"]
        email <- map["Email"]
        contractDetails <- map["ContractDetails"]
        userRole <- map["UserRole"]
        creator <- map["Creator"]
        updatedBy <- map["UpdatedBy"]
    }
}

class Departments: Mappable {
    
    var departmentId: Int?
    var isEnable: Bool?
    var userId: Int?
    var id: Int?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        departmentId <- map["DepartmentId"]
        isEnable <- map["IsEnable"]
        userId <- map["UserId"]
        id <- map["Id"]
    }
}

class Positions: Mappable {
    
    var isEnable: Bool?
    var userId: Int?
    var id: Int?
    var positionId: Int?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        isEnable <- map["IsEnable"]
        userId <- map["UserId"]
        id <- map["Id"]
        positionId <- map["PositionId"]
    }
}

class ContractDetails: Mappable {
    
    var endDate: String?
    var startDate: String?
    var number: String?
    var id: Int?
    var userId: Int?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        endDate <- map["EndDate"]
        startDate <- map["StartDate"]
        number <- map["Number"]
        id <- map["Id"]
        userId <- map["UserId"]
    }
}
