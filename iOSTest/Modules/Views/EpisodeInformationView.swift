//
//  EpisodeInformationView.swift
//  iOSTest
//
//  Created by Mario Vanegas on 3/2/23.
//

import SwiftUI

struct EpisodeInformationView: View {
    @StateObject var viewModel: EpisodeInformationViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                HeaderView(imageURL: viewModel.episode?.image?.medium ?? "",
                           title: viewModel.episode?.name ?? "")
                
                VStack(alignment: .leading, spacing: 16) {
                    VStack(alignment: .leading) {
                        Text(viewModel.episode?.name ?? "")
                            .font(.title)
                        Text("Season \(viewModel.episode?.season ?? 0)")
                            .font(.title2)
                    }
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Summary")
                            .font(.title2)
                            .bold()
                        
                        Text(viewModel.episode?.summary ?? "")
                    }
                }
                .padding(.horizontal, 16)
            }
        }
        .activityIndicator(isLoading: viewModel.isLoading)
        .navigationTitle(viewModel.episode?.name ?? "")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear(perform: viewModel.fetchEpisodeInformation)
    }
}
