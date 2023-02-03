//
//  NetworkManager.swift
//  iOSTest
//
//  Created by Mario Vanegas on 3/2/23.
//

import Foundation
import Combine

// MARK: Manager Protocol
protocol NetworkManagerType {
    func request(_ target: AppTargetType) -> AnyPublisher<NetworkResponse, Error>
}

// MARK: Protocol Composition for DI
protocol HasNetworkManagerType {
    var networkManager: NetworkManagerType { get }
}

// MARK: Implementation
struct NetworkManager: NetworkManagerType {
    typealias Dependencies = HasMoyaManagerType
    
    private let dependencies: Dependencies
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    func request(_ target: AppTargetType) -> AnyPublisher<NetworkResponse, Error> {
        dependencies.moyaManager
            .request(target)
            .map { (data: $0.data, httpResponse: $0.response) }
            .eraseToAnyPublisher()
    }
}

// MARK: Manager Extensions
extension NetworkManagerType {
    func request<T: Decodable>(_ target: AppTargetType, using decoder: JSONDecoder = .init()) -> AnyPublisher<DecodedResponse<T>, Error> {
        request(target)
            .tryMap { response in
                let decodedResponse = try decoder.decode(T.self, from: response.data)
                return (response: decodedResponse, httpResponse: response.httpResponse)
            }
            .eraseToAnyPublisher()
    }
    
    func request<T: Decodable>(_ target: AppTargetType, using decoder: JSONDecoder = .init()) -> AnyPublisher<T, Error> {
        request(target)
            .map(\.data)
            .decode(type: T.self, decoder: decoder)
            .eraseToAnyPublisher()
    }
}

// MARK: Dependencies
struct NetworkManagerDependencies: HasMoyaManagerType {
    var moyaManager: MoyaManagerType = MoyaManager()
}
