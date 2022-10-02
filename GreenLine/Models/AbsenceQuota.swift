//
//  AbsenceQuota.swift
//  GreenLine
//
//  Created by EAPPLE on 02/10/2022.
//

import ObjectMapper

class AbsenceQuota: Mappable {
    
    var requested: Int?
    var remaining: Int?
    var totalCount: Int?
    var approved: Int?
    var used: Int?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        requested <- map["Requested"]
        remaining <- map["Remaining"]
        totalCount <- map["TotalCount"]
        approved <- map["Approved"]
        used <- map["Used"]
    }
}
