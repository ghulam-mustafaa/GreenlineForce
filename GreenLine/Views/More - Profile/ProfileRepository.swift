//
//  ProfileRepository.swift
//  GreenLine
//
//  Created by EAPPLE on 13/09/2022.
//

import Foundation
import Alamofire
import ObjectMapper

class ProfileRepository {
    func updateUserProfile(fname: String, lname: String, password: String, phone: String, withCompletion completion: @escaping (ScheduleResult) -> Void) {
        APIClient.shared.performRequest(UpdateProfileRequest.updateProfile(fname: fname, lname: lname, password: password, phone: phone), shouldAddHeader: true) { (result: APIClientResult) in
            switch result {
                case .success(let value):
                    print(value)
                    guard let (headers, body) = value as? ([String: Any], [String: Any]) else {
                        completion(.failure(GreenlineError(message: "Failed to parse data")))
                        return
                    }
                    if let error = Mapper<GreenlineError>().map(JSONObject: body) {
                        completion(.failure(error))
                        return
                    }
                    guard let shiftList = Mapper<ShiftList>().map(JSONObject: body) else {
                        completion(.failure(GreenlineError(message: "Failed to parse data")))
                        return
                    }
                    completion(.success(shiftList.shifts ?? []))
                case .failure(let error):
                    completion(.failure(error))
            }
        }
    }
}

enum UpdateProfileRequest: HTTPRequest {
    case updateProfile(fname: String, lname: String, password: String, phone: String)
}

extension UpdateProfileRequest {
    var endPoint: URL? {
        switch self {
            case .updateProfile: return Endpoint.updateUserProfile
        }
    }
    var method: HTTPMethod {
        switch self {
            case .updateProfile: return .post
        }
    }
    var parameters: Parameters? {
        switch self {
            case .updateProfile(let fname, let lname, let password, let phone):
                let params: Parameters = [
                    "FirstName": fname.trim(),
                    "LastName": lname.trim(),
                    "Password": password.trim(),
                    "Phone": phone.trim(),
                    "Name": "\(fname.trim()) \(lname.trim())",
                    "Email": SessionManager.shared.user?.email ?? ""
                ]
                return params
        }
    }
}
