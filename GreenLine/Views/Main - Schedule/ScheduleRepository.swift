//
//  ScheduleRepository.swift
//  GreenLine
//
//  Created by EAPPLE on 12/09/2022.
//

import Foundation
import Alamofire
import ObjectMapper

typealias ScheduleResult = (Result<[Shift], GreenlineError>)
typealias AnsenceQuotaResult = (Result<AbsenceQuota, GreenlineError>)

class ScheduleRepository {
    func getAllShifts(from: String?, toDate: String?, pageNo: Int, searchText: String = "", withCompletion completion: @escaping (ScheduleResult) -> Void) {
        guard let from = from, let toDate = toDate else {
            return
        }
        APIClient.shared.performRequest(ScheduleRequest.getShifts(pageNo: pageNo, searchText: searchText, fromDate: from, ToDate: toDate), shouldAddHeader: true) { (result: APIClientResult) in
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

enum ScheduleRequest: HTTPRequest {
    case getShifts(pageNo: Int, searchText: String, fromDate: String, ToDate: String)
}

extension ScheduleRequest {
    var endPoint: URL? {
        switch self {
            case .getShifts: return Endpoint.getAllShifts
        }
    }
    var method: HTTPMethod {
        switch self {
            case .getShifts: return .post
        }
    }
    var parameters: Parameters? {
        switch self {
            case .getShifts(let pageNo, let searchText, let fromDate, let toDate):
                let params: Parameters = [
                    "Page": pageNo,
                    "SearchText": searchText,
                    "From": fromDate,
                    "To": toDate,
                    "Size": 500
                ]
                return params
        }
    }
}
