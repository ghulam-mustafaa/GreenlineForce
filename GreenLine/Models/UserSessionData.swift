//
//  UserSessionData.swift
//  GreenLine
//
//  Created by EAPPLE on 07/09/2022.
//

import ObjectMapper

class UserSessionData: Mappable {
    
    var token: String?
    var expiration: String?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        token <- map["token"]
        expiration <- map["expiration"]
    }
}
