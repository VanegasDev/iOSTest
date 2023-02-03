//
//  ShowRequest.swift
//  iOSTest
//
//  Created by Mario Vanegas on 3/2/23.
//

import Foundation
import Moya

enum ShowRequest: AppTargetType {
    case shows
}

extension ShowRequest {
    var requestEndpoint: String {
        switch self {
        case .shows:
            return "/shows"
        }
    }
    
    var requestMethod: NetworkMethod {
        switch self {
        case .shows:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .shows:
            return .requestPlain
        }
    }
}
