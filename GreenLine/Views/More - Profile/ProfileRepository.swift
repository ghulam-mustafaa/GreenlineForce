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
    func updateUserProfile(fname: String, lname: String, phone: String,
                           mobile: String, birthday: String, gender: String,
                           ecName: String, ecPhone: String, ecRelation: String,
                           carAccess: Bool, drivingStatus: Bool,
                           withCompletion completion: @escaping (ScheduleResult) -> Void) {
        APIClient.shared.performRequest(UpdateProfileRequest.updateProfile(fname: fname, lname: lname, phone: phone, mobile: mobile, birthday: birthday, gender: gender, ecName: ecName, ecPhone: ecPhone, ecRelation: ecRelation, carAccess: carAccess, drivingStatus: drivingStatus), shouldAddHeader: true) { (result: APIClientResult) in
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
    
    func uploadImage(with data: Data, withCompletion completion: @escaping (ProfilePictureResult) -> Void) {
        APIClient.shared.uploadImage(with: data, andCompletion: { (result: APIClientResult) in
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
                    completion(.success(nil))
                case .failure(let error):
                    completion(.failure(error))
            }
            
        })
    }
}

enum UpdateProfileRequest: HTTPRequest {
    case updateProfile(fname: String, lname: String, phone: String,
                       mobile: String, birthday: String, gender: String,
                       ecName: String, ecPhone: String, ecRelation: String,
                       carAccess: Bool, drivingStatus: Bool)
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
            case .updateProfile(let fname, let lname, let phone,
                                let mobile, let birthday, let gender,
                                let ecName, let ecPhone, let ecRelation,
                                let carAccess, let drivingStatus):
                let contact: [String: String] = [
                    "Name": ecName.trim(),
                    "Phone": ecPhone.trim(),
                    "Relation": ecRelation.trim()
                ]
                let params: Parameters = [
                    "UserId": SessionManager.shared.user?.userId ?? -1,
                    "FirstName": fname.trim(),
                    "LastName": lname.trim(),
                    "PhoneNumber": phone.trim(),
                    "Email": SessionManager.shared.user?.email ?? "",
                    "MobileNumber": mobile,
                    "DoB": birthday,
                    "Gender": gender,
                    "CarAccess": carAccess,
                    "DrivingLiscense": drivingStatus,
                    "EmergencyContact": contact
                ]
                return params
        }
    }
}
