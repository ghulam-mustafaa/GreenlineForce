//
//  LoginRepository.swift
//  GreenLine
//
//  Created by EAPPLE on 07/09/2022.
//

import Foundation
import Alamofire
import ObjectMapper

typealias LoginResult = (Result<UserSessionData, GreenlineError>)

class LoginRepositry {
    func loginUser(withEmail email : String, andPassword password : String, withCompletion completion: @escaping (LoginResult) -> Void) {
        APIClient.shared.performRequest(LoginRequest.login(email: email, password: password), shouldAddHeader: false) { (result: APIClientResult) in
            switch result {
                case .success(let value):
                    guard let (headers, body) = value as? ([String: Any], [String: Any]) else {
                        completion(.failure(GreenlineError(message: "Failed to parse data")))
                        return
                    }
                    if let error = Mapper<GreenlineError>().map(JSONObject: body) {
                        completion(.failure(error))
                        return
                    }
                    guard let sessionData = Mapper<UserSessionData>().map(JSONObject: body) else {
                        completion(.failure(GreenlineError(message: "Failed to parse data")))
                        return
                    }
                    completion(.success(sessionData))
                case .failure(let error):
                    completion(.failure(error))
            }
        }
    }
    
}

enum LoginRequest: HTTPRequest {
    case login(email : String, password : String)
}

extension LoginRequest {
    var endPoint: URL? {
        switch self {
            case .login: return Endpoint.login
        }
    }
    var method: HTTPMethod {
        switch self {
            case .login: return .post
        }
    }
    var parameters: Parameters? {
        switch self {
            case .login(let email,let password):
                let params: Parameters = ["email": email,
                                          "password": password,
                                          "IsWeb": 0
                ]
                return params
        }
    }
}
