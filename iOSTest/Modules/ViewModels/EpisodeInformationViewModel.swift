//
//  EpisodeInformationViewModel.swift
//  iOSTest
//
//  Created by Mario Vanegas on 3/2/23.
//

import Foundation
import Combine

class EpisodeInformationViewModel: ObservableObject {
    typealias Dependencies = HasEpisodeServiceType
    
    @Published var episode: Episode?
    @Published var isLoading = false
    
    private let dependencies: Dependencies
    private let episodeId: Int
    
    private var cancellables: Set<AnyCancellable> = []
    
    init(dependencies: Dependencies, episodeId: Int) {
        self.dependencies = dependencies
        self.episodeId = episodeId
    }
    
    func fetchEpisodeInformation() {
        dependencies
            .episodeService
            .fetchEpisodeInformation(id: episodeId)
            .handleEvents(receiveRequest: { [weak self] _ in self?.isLoading = true })
            .sink { [weak self] response in
                if case let .failure(error) = response {
                    print("ERROR: \(error.localizedDescription)")
                }
                
                self?.isLoading = false
            } receiveValue: { [weak self] episode in
                self?.episode = episode
            }
            .store(in: &cancellables)
    }
}

// MARK: Dependencies
struct EpisodeInformationViewModelDependencies: HasEpisodeServiceType {
    var episodeService: EpisodeServiceType = EpisodeService(dependencies: EpisodeServiceDependencies())
}
