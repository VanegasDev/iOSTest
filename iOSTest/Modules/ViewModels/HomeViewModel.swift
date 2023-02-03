//
//  HomeViewModel.swift
//  iOSTest
//
//  Created by Mario Vanegas on 3/2/23.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    typealias Dependencies = HasShowsServiceType
    
    @Published var shows: [ShowPreview] = []
    @Published var isLoading = false
    
    private let dependencies: Dependencies
    private var cancellables: Set<AnyCancellable> = []
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    func fetchShowList() {
        guard shows.isEmpty else { return }
        
        dependencies
            .showsService
            .fetchShowList()
            .handleEvents(receiveRequest: { [weak self] _ in self?.isLoading = true })
            .sink { [weak self] response in
                if case let .failure(error) = response {
                    print("ERROR: \(error.localizedDescription)")
                }
                
                self?.isLoading = false
            } receiveValue: { [weak self] showList in
                self?.shows = showList
            }
            .store(in: &cancellables)
    }
}

// MARK: Dependencies
struct HomeViewModelDependencies: HasShowsServiceType {
    var showsService: ShowsServiceType = ShowsService(dependencies: ShowsServiceDependencies())
}
