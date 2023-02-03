//
//  ShowsService.swift
//  iOSTest
//
//  Created by Mario Vanegas on 3/2/23.
//

import Foundation
import Combine

// MARK: Protocol
protocol ShowsServiceType {
    func fetchShowList() -> AnyPublisher<[ShowPreview], Error>
    func fetchShowInformation(showId: Int) -> AnyPublisher<Show, Error>
}

// MARK: Protocol Composition for DI
protocol HasShowsServiceType {
    var showsService: ShowsServiceType { get }
}

// MARK: Implementation
struct ShowsService: ShowsServiceType {
    typealias Dependencies = HasNetworkManagerType
    
    private let dependencies: Dependencies
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    func fetchShowList() -> AnyPublisher<[ShowPreview], Error> {
        dependencies.networkManager.request(ShowRequest.shows)
    }
    
    func fetchShowInformation(showId: Int) -> AnyPublisher<Show, Error> {
        dependencies.networkManager.request(ShowRequest.show(id: showId))
    }
}

// MARK: Dependencies
struct ShowsServiceDependencies: HasNetworkManagerType {
    var networkManager: NetworkManagerType = NetworkManager(dependencies: NetworkManagerDependencies())
}
