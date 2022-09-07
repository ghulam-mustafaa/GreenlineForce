//
//  Environment.swift
//  GreenLine
//
//  Created by EAPPLE on 07/09/2022.
//

import Foundation

enum Environment {
    
    case development
    case staging
    case production
    
    static var current: Environment { return .development }
    
    static var baseUrl: URL? {
        switch current {
            case .development: return URL(string: "http://149.102.130.63:8085/api/")
            case .staging: return URL(string: "http://149.102.130.63:8085/api/")
            case .production: return URL(string: "http://149.102.130.63:8085/api/")
        }
    }
}
