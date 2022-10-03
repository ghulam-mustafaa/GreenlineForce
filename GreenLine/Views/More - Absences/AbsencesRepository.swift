//
//  AbsencesRepository.swift
//  GreenLine
//
//  Created by EAPPLE on 02/10/2022.
//

import Foundation
import Alamofire
import ObjectMapper

typealias AbsenceQuotaResult = (Result<AbsenceQuota, GreenlineError>)
typealias AbsenceListResult = (Result<[Absence], GreenlineError>)

class AbsencesRepository {
    func getAbsenceQuota(withCompletion completion: @escaping (AbsenceQuotaResult) -> Void) {
        APIClient.shared.performRequest(AbsencesRequest.getQuota, shouldAddHeader: true, andCompletion: {(result: APIClientResult) in
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
                    guard let quota = Mapper<AbsenceQuota>().map(JSONObject: body) else {
                        completion(.failure(GreenlineError(message: "Failed to parse data")))
                        return
                    }
                    completion(.success(quota))
                case .failure(let error):
                    completion(.failure(error))
            }
        })
    }
    
    func getAbsences(fromDate: String, toDate: String, withCompletion completion: @escaping (AbsenceListResult) -> Void) {
        APIClient.shared.performRequest(AbsencesRequest.getAbsences(fromDate: fromDate, toDate: toDate), shouldAddHeader: true, andCompletion: {(result: APIClientResult) in
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
                    guard let absenceList = Mapper<AbsenceList>().map(JSONObject: body) else {
                        completion(.failure(GreenlineError(message: "Failed to parse data")))
                        return
                    }
                    completion(.success(absenceList.absences ?? []))
                case .failure(let error):
                    completion(.failure(error))
            }
        })
    }
    
    func requestAbsence(type: Int, fromDate: String, toDate: String, comment: String,
                        withCompletion completion: @escaping (AbsenceQuotaResult) -> Void) {
        print(fromDate, toDate)
        APIClient.shared.performRequest(AbsencesRequest.requestAbsence(type: type, fromDate: fromDate, toDate: toDate, comment: comment), shouldAddHeader: true, andCompletion: {(result: APIClientResult) in
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
                    guard let quota = Mapper<AbsenceQuota>().map(JSONObject: body) else {
                        completion(.failure(GreenlineError(message: "Failed to parse data")))
                        return
                    }
                    completion(.success(quota))
                case .failure(let error):
                    completion(.failure(error))
            }
        })
    }
}

enum AbsencesRequest: HTTPRequest {
    case getQuota
    case getAbsences(fromDate: String, toDate: String)
    case requestAbsence(type: Int, fromDate: String, toDate: String, comment: String)
}

extension AbsencesRequest {
    var endPoint: URL? {
        switch self {
            case .getQuota: return Endpoint.getAbsencesQuota
            case .requestAbsence: return Endpoint.requestAbsence
            case .getAbsences: return Endpoint.getAbsences
        }
    }
    var method: HTTPMethod {
        switch self {
            case .getQuota, .requestAbsence, .getAbsences: return .post
        }
    }
    var parameters: Parameters? {
        switch self {
            case .getQuota:
                let params = [
                    "uId": 0,
                    "uRole": 0
                ]
                return params
            case .requestAbsence(let type, let fromDate, let toDate, let comment):
                let params: Parameters? = [
                    "uId": SessionManager.shared.user?.userId ?? -1,
                    "uRole": 0,
                    "Type": type,
                    "From": fromDate,
                    "To": toDate,
                    "Comment": comment,
                    "Status": 1
                ]
                return params
            case .getAbsences(let fromDate, let toDate):
                let params: Parameters? = [
                    "uId": SessionManager.shared.user?.userId ?? -1,
                    "uRole": 0,
                    "From": fromDate,
                    "To": toDate,
                ]
                return params
        }
    }
}
