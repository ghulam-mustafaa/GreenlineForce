//
//  Absence.swift
//  GreenLine
//
//  Created by EAPPLE on 04/10/2022.
//

import ObjectMapper

class Absence: Mappable {
    
    var date: String?
    var createdOn: String?
    var updatedOn: String?
    var isDeleted: Bool?
    var description: String?
    var updatedBy: Int?
    var userId: Int?
    var id: Int?
    var status: Int?
    var type: String?
    var typeId: Int?
    var createdBy: Int?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        date <- map["Date"]
        createdOn <- map["CreatedOn"]
        updatedOn <- map["UpdatedOn"]
        isDeleted <- map["IsDeleted"]
        description <- map["Description"]
        updatedBy <- map["UpdatedBy"]
        userId <- map["UserId"]
        id <- map["Id"]
        status <- map["Status"]
        type <- map["Type"]
        typeId <- map["TypeId"]
        createdBy <- map["CreatedBy"]
    }
}

class AbsenceList: Mappable {
    
    var absences: [Absence]?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        absences <- map["Absences"]
    }
}
