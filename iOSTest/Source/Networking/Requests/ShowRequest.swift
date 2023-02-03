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
    case show(id: Int)
}

extension ShowRequest {
    var requestEndpoint: String {
        switch self {
        case .shows:
            return "/shows"
        case let .show(id):
            return "/shows/\(id)"
        }
    }
    
    var requestMethod: NetworkMethod {
        switch self {
        case .shows, .show:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .shows, .show:
            return .requestPlain
        }
    }
}
