//
//  CancelShift.swift
//  GreenLine
//
//  Created by EAPPLE on 12/10/2022.
//

import ObjectMapper

class CancelShift: Mappable {
    
    var message: String?
    var status: String?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        message <- map["Message"]
        status <- map["Status"]
    }
}
