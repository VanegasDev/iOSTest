//
//  HomeView.swift
//  iOSTest
//
//  Created by Mario Vanegas on 3/2/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel(dependencies: HomeViewModelDependencies())
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(viewModel.shows) { show in
                    NavigationLink {
                        ShowInformationView(viewModel: ShowInformationViewModel(dependencies: ShowInformationViewModelDependencies(),
                                                                                showId: show.id))
                    } label: {
                        ShowItemView(show: show)
                            .shadow(radius: 7)
                            .padding(.vertical, 8)
                            .padding(.horizontal, 16)
                    }
                }
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .activityIndicator(isLoading: viewModel.isLoading)
        .onAppear(perform: viewModel.fetchShowList)
        .navigationTitle("Show List")
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
        }
    }
}
