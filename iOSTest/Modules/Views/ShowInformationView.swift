//
//  ShowInformationView.swift
//  iOSTest
//
//  Created by Mario Vanegas on 3/2/23.
//

import SwiftUI

struct ShowInformationView: View {
    @StateObject var viewModel: ShowInformationViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                HeaderView(imageURL: viewModel.show?.image?.medium ?? "", title: viewModel.show?.name ?? "")
                
                VStack(alignment: .leading, spacing: 16) {
                    HStack {
                        ForEach(viewModel.show?.genres ?? [], id: \.self) { genre in
                            Text(genre)
                                .font(.caption2)
                                .padding(4)
                                .background(Color(ColorAsset.Main.complementary2))
                                .clipShape(Capsule())
                                .foregroundColor(Color(ColorAsset.Supplementary.black))
                        }
                    }
                    .isHidden(viewModel.show?.genres.isEmpty ?? true)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("On Air:")
                            .font(.footnote)
                        
                        HStack {
                            ForEach(viewModel.show?.schedule.days ?? [], id: \.self) { genre in
                                Text(genre)
                                    .font(.caption2)
                                    .padding(4)
                                    .background(Color(ColorAsset.Main.complementary2))
                                    .clipShape(Capsule())
                                    .foregroundColor(Color(ColorAsset.Supplementary.black))
                            }
                        }
                        
                        HStack {
                            Image(systemName: "clock")
                            Text(viewModel.show?.schedule.time ?? "")
                                .font(.footnote)
                        }
                    }
                    .isHidden(viewModel.show?.schedule.days.isEmpty ?? true)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Summary")
                            .font(.title2)
                            .bold()
                        
                        Text(viewModel.show?.summary ?? "")
                    }
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Episodes")
                            .font(.title2)
                            .bold()
                        
                        ForEach(viewModel.seasons, id: \.self) { season in
                            SeasonListView(season: season, episodes: viewModel.episodes[season] ?? [])
                        }
                    }
                    .isHidden(viewModel.episodes.isEmpty)
                }
                .padding(.horizontal, 16)
            }
        }
        .activityIndicator(isLoading: viewModel.isLoading)
        .navigationTitle(viewModel.show?.name ?? "")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            viewModel.fetchShowInformation()
            viewModel.fetchShowEpisodes()
        }
    }
}
