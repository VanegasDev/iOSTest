//
//  EpisodeRequest.swift
//  iOSTest
//
//  Created by Mario Vanegas on 3/2/23.
//

import Foundation
import Moya

enum EpisodeRequest: AppTargetType {
    case episode(id: Int)
}

extension EpisodeRequest {
    var requestEndpoint: String {
        switch self {
        case let .episode(id):
            return "/episodes/\(id)"
        }
    }
    
    var requestMethod: NetworkMethod {
        switch self {
        case .episode:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .episode:
            return .requestPlain
        }
    }
}
