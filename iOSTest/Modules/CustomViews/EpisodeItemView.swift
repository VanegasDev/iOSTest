//
//  EpisodeItemView.swift
//  iOSTest
//
//  Created by Mario Vanegas on 3/2/23.
//

import SwiftUI

struct EpisodeItemView: View {
    let episode: EpisodePreview
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: episode.image?.medium ?? "")) { image in
                image.resizable()
            } placeholder: {
                VStack {
                    Spacer()
                    ProgressView()
                    Spacer()
                }
            }
            .frame(height: 130)
            
            Text(episode.name)
                .font(.footnote)
                .foregroundColor(Color(ColorAsset.Supplementary.white))
            
            Spacer()
        }
        .frame(width: 110, height: 180)
        .background(Color(ColorAsset.Main.secondary1))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

struct EpisodeItemView_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeItemView(episode: EpisodePreview(id: 1,
                                                name: "Test Super Test With Super",
                                                season: 1,
                                                image: ImageInformation(medium: "https://static.tvmaze.com/uploads/images/medium_portrait/81/202627.jpg",
                                                                        original: ""))
        )
    }
}

