//
//  SeasonListView.swift
//  iOSTest
//
//  Created by Mario Vanegas on 3/2/23.
//

import SwiftUI

struct SeasonListView: View {
    let season: Int
    let episodes: [EpisodePreview]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Season \(season)")
                .font(.title2)
            
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(episodes) { episode in
                        NavigationLink {
                            EpisodeInformationView(viewModel: EpisodeInformationViewModel(dependencies: EpisodeInformationViewModelDependencies(),
                                                                                          episodeId: episode.id))
                        } label: {
                            EpisodeItemView(episode: episode)
                        }
                    }
                }
            }
            .frame(height: 180)
        }
    }
}

struct SeasonListView_Previews: PreviewProvider {
    static var previews: some View {
        SeasonListView(season: 1, episodes: [])
    }
}
