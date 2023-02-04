//
//  ShowInformationViewModel.swift
//  iOSTest
//
//  Created by Mario Vanegas on 3/2/23.
//

import Foundation
import Combine

class ShowInformationViewModel: ObservableObject {
    typealias Dependencies = HasShowsServiceType
    
    @Published var show: Show?
    @Published var isLoading = false
    @Published var episodes: [Int: [EpisodePreview]] = [:]
    @Published var seasons: [Int] = []
    
    private let dependencies: Dependencies
    private let showId: Int
    
    private var cancellables: Set<AnyCancellable> = []
    
    init(dependencies: Dependencies, showId: Int) {
        self.dependencies = dependencies
        self.showId = showId
    }
    
    func fetchShowInformation() {
        dependencies
            .showsService
            .fetchShowInformation(showId: showId)
            .handleEvents(receiveRequest: { [weak self] _ in self?.isLoading = true })
            .sink { [weak self] response in
                if case let .failure(error) = response {
                    print("ERROR: \(error.localizedDescription)")
                }
                
                self?.isLoading = false
            } receiveValue: { [weak self] showInformation in
                self?.show = showInformation
            }
            .store(in: &cancellables)
    }
    
    func fetchShowEpisodes() {
        dependencies
            .showsService
            .fetchShowEpisodes(showId: showId)
            .sink { response in
                if case let .failure(error) = response {
                    print("ERROR: \(error.localizedDescription)")
                }
            } receiveValue: { [weak self] episodes in
                let dictionary = Dictionary(grouping: episodes) { $0.season }
                let seasons = dictionary.map { $0.key }
                
                self?.seasons = seasons.sorted(by: <)
                self?.episodes = dictionary
            }
            .store(in: &cancellables)
    }
}

// MARK: Dependencies
struct ShowInformationViewModelDependencies: HasShowsServiceType {
    var showsService: ShowsServiceType = ShowsService(dependencies: ShowsServiceDependencies())
}
