//
//  EpisodesService.swift
//  iOSTest
//
//  Created by Mario Vanegas on 3/2/23.
//

import Foundation
import Combine

// MARK: Protocol
protocol EpisodeServiceType {
    func fetchEpisodeInformation(id: Int) -> AnyPublisher<Episode, Error>
}

// MARK: Protocol Composition for DI
protocol HasEpisodeServiceType {
    var episodeService: EpisodeServiceType { get }
}

// MARK: Implementation
struct EpisodeService: EpisodeServiceType {
    typealias Dependencies = HasNetworkManagerType
    
    private let dependencies: Dependencies
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    func fetchEpisodeInformation(id: Int) -> AnyPublisher<Episode, Error> {
        dependencies.networkManager.request(EpisodeRequest.episode(id: id))
    }
}

// MARK: Dependencies
struct EpisodeServiceDependencies: HasNetworkManagerType {
    var networkManager: NetworkManagerType = NetworkManager(dependencies: NetworkManagerDependencies())
}
