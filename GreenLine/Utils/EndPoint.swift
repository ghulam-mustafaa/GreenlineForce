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
}
