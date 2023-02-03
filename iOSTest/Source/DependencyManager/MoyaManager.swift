//
//  MoyaManager.swift
//  iOSTest
//
//  Created by Mario Vanegas on 3/2/23.
//

import Foundation
import Moya
import CombineMoya
import Combine

// MARK: Manager Protocol
protocol MoyaManagerType {
    func request(_ target: TargetType) -> AnyPublisher<Moya.Response, Error>
}

// MARK: Protocol Composition for DI
protocol HasMoyaManagerType {
    var moyaManager: MoyaManagerType { get }
}

// MARK: Implementation
struct MoyaManager: MoyaManagerType {
    private let provider: MoyaProvider<MultiTarget> = MoyaProvider()
    
    func request(_ target: TargetType) -> AnyPublisher<Moya.Response, Error> {
        provider.requestPublisher(MultiTarget(target))
            .mapError { $0 }
            .eraseToAnyPublisher()
    }
}

// MARK: Manager Extensions
extension MoyaManagerType {
    func request<T: Decodable>(_ target: AppTargetType, using decoder: JSONDecoder = .init()) -> AnyPublisher<DecodedResponse<T>, Error> {
        request(target)
            .tryMap { response in
                let decodedResponse = try decoder.decode(T.self, from: response.data)
                return (response: decodedResponse, httpResponse: response.response)
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
