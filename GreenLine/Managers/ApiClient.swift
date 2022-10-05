//
//  ApiClient.swift
//  GreenLine
//
//  Created by EAPPLE on 07/09/2022.
//

import Foundation
import Alamofire
import ObjectMapper

protocol HTTPRequest {
    var endPoint: URL? { get }
    var method: HTTPMethod { get }
    var parameters: Parameters? { get }
    var headers: HTTPHeaders? { get }
}

extension HTTPRequest {
    var parameters: Parameters? { nil }
    var headers: HTTPHeaders? { nil }
}

typealias APIClientResult = Result<Any, GreenlineError>

class APIClient {
    
    // MARK: - Class Instances
    
    static let shared = APIClient()
    
    
    // MARK: - Initializers
    
    private init() {}
    
    // MARK: - Public Methods
    
    func performRequest(_ request: HTTPRequest, shouldAddHeader : Bool = true, andCompletion completion: @escaping (APIClientResult) -> Void) {
        
        guard let url = request.endPoint else {
            completion(.failure(GreenlineError(message: "URL not found")))
            return
        }
        var headers: HTTPHeaders?
        if shouldAddHeader {
            let auth = HTTPHeader(name: "Authorization", value: "Bearer " + UserDefaultsManager.accessToken)
            let client = HTTPHeader(name: "accept", value: "*/*" )
            let uid = HTTPHeader(name: "Content-Type", value:  "application/json" )
            headers = [auth,client,uid]
            request.headers?.forEach{ headers?.add($0)}
        }
        let parameterEncoding: ParameterEncoding = request.method == .get ? URLEncoding() : JSONEncoding()
        AF.request(
            url, method: request.method,
            parameters: request.parameters,
            encoding: parameterEncoding,
            headers: headers
        ).responseJSON { response in
            print(response)
            if response.response?.statusCode == 401 {
                completion(.failure(GreenlineError(message: "Email or password is incorrect")))
                return
            }
            if response.response?.statusCode == 405 {
                completion(.failure(GreenlineError(message: "Please register first")))
                return
            }
            let headers = response.response?.allHeaderFields ?? [:]
            switch response.result {
                case .success(let value):
                    completion(.success((headers: headers, body: value)))
                case .failure(let error):
                    guard let afError = error as? AFError else {
                        completion(.failure(GreenlineError(message: error.errorDescription ??
                                                         "Something went wrong")))
                        return
                    }
                    switch afError {
                        case .sessionTaskFailed( _):
                            completion(.failure(GreenlineError(message: "Your internet connection appears to be offline")))
                        default:
                            completion(.failure(GreenlineError(message: afError.errorDescription ??
                                                               "Something went wrong")))
                    }
                    
            }
        }
    }
    
    func uploadImage(with data: Data, andCompletion completion: @escaping (APIClientResult) -> Void) {
        let url = URL(string: "http://149.102.130.63:8085/api/User/UploadProfilePicture")!
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("Bearer \(UserDefaultsManager.accessToken)", forHTTPHeaderField: "Authorization")
        urlRequest.setValue("*/*", forHTTPHeaderField: "accept")
        AF.upload(multipartFormData: { (multipartFormData) in
            multipartFormData.append(data, withName: "file", fileName: "swift_file.png", mimeType: "image/png")
        }, with: urlRequest).responseJSON(completionHandler: { response in
            print(response)
            if response.response?.statusCode == 401 {
                completion(.failure(GreenlineError(message: "Email or password is incorrect")))
                return
            }
            if response.response?.statusCode == 405 {
                completion(.failure(GreenlineError(message: "Please register first")))
                return
            }
            let headers = response.response?.allHeaderFields ?? [:]
            switch response.result {
                case .success(let value):
                    completion(.success((headers: headers, body: value)))
                case .failure(let error):
                    guard let afError = error as? AFError else {
                        completion(.failure(GreenlineError(message: error.errorDescription ??
                                                           "Something went wrong")))
                        return
                    }
                    switch afError {
                        case .sessionTaskFailed( _):
                            completion(.failure(GreenlineError(message: "Your internet connection appears to be offline")))
                        default:
                            completion(.failure(GreenlineError(message: afError.errorDescription ??
                                                               "Something went wrong")))
                    }
                    
            }
        })
    }
}
