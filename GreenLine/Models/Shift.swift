//
//  Shift.swift
//  GreenLine
//
//  Created by EAPPLE on 12/09/2022.
//

import ObjectMapper

class ShiftList: Mappable {
    
    var shifts: [Shift]?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        shifts <- map["Shifts"]
    }
}

class Shift: Mappable {
    
    var id: Int?
    var userId: Int?
    var locationId: Int?
    var positionId: Int?
    var shiftDates: [String]?
    var shiftStart: String?
    var shiftEnd: String?
    var breakMinutes: Int?
    var notes: String?
    var isDeleted: Bool?
    var createdOn: String?
    var createdBy: String?
    var updatedOn: String?
    var updatedBy: String?
    var paymentDetails: [String]?
    var locationName: String?
    var positionName: String?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        id <- map["Id"]
        userId <- map["UserId"]
        locationId <- map["LocationId"]
        positionId <- map["PositionId"]
        shiftDates <- map["ShiftDates"]
        shiftStart <- map["ShiftStart"]
        shiftEnd <- map["ShiftEnd"]
        breakMinutes <- map["BreakMinutes"]
        notes <- map["Note"]
        isDeleted <- map["IsDeleted"]
        createdOn <- map["CreatedOn"]
        createdBy <- map["CreatedBy"]
        updatedOn <- map["UpdatedOn"]
        updatedBy <- map["UpdatedBy"]
        paymentDetails <- map["PaymentDetails"]
        locationName <- map["Location"]
        positionName <- map["Position"]
    }
}
