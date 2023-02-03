//
//  Configuration.swift
//  iOSTest
//
//  Created by Mario Vanegas on 3/2/23.
//

import Foundation
import Moya

// MARK: Networking Types
typealias NetworkResponse = (data: Data, httpResponse: HTTPURLResponse?)
typealias DecodedResponse<T: Decodable> = (response: T, httpResponse: HTTPURLResponse?)

enum NetworkMethod: String {
    case post = "POST"
    case put = "PUT"
    case get = "GET"
    case delete = "DELETE"
    case patch = "PATCH"
}

protocol AppTargetType: TargetType {
    var apiURL: URL { get }
    var requestEndpoint: String { get }
    var requestHeaders: [String: String]? { get }
    var requestMethod: NetworkMethod { get }
}

// MARK: App Implementation
extension AppTargetType {
    var apiURL: URL {
        guard let url = URL(string: Constants.baseURL) else {
            fatalError("Base URL Couldn't be Configured")
        }
        
        return url
    }
    
    var requestHeaders: [String: String]? {
        ["Content-Type": "application/json"]
    }
}

// MARK: Moya Implementation
extension AppTargetType {
    var baseURL: URL {
        apiURL
    }
    
    var method: Moya.Method {
        switch requestMethod {
        case .delete: return .delete
        case .post: return .post
        case .get: return .get
        case .patch: return .patch
        case .put: return .put
        }
    }
    
    var headers: [String : String]? {
        requestHeaders
    }
    
    var path: String {
        requestEndpoint
    }
    
    var validationType: ValidationType {
        .successCodes
    }
    
    var sampleData: Data {
        Data()
    }
}
