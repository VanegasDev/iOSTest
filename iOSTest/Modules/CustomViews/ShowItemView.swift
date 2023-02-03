//
//  ShowItemView.swift
//  iOSTest
//
//  Created by Mario Vanegas on 3/2/23.
//

import SwiftUI

struct ShowItemView: View {
    let show: ShowPreview
    
    var body: some View {
        HStack(alignment: .top) {
            AsyncImage(url: URL(string: show.image?.medium ?? "")) { image in
                image.resizable()
            } placeholder: {
                VStack {
                    Spacer()
                    ProgressView()
                    Spacer()
                }
            }
            .frame(width: 110)
            
            VStack(alignment: .leading, spacing: 6) {
                HStack {
                    ForEach(show.genres.prefix(2), id: \.self) { genre in
                        Text(genre)
                            .font(.caption2)
                            .padding(4)
                            .background(Color(ColorAsset.Main.complementary2))
                            .clipShape(Capsule())
                            .foregroundColor(Color(ColorAsset.Supplementary.black))
                    }
                }
                
                Text(show.name)
                    .font(.title2)
                
                Text(show.summary)
                    .font(.footnote)
            }
            .foregroundColor(Color(ColorAsset.Supplementary.white))
            .padding(.vertical, 8)
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .frame(height: 150)
        .background(Color(ColorAsset.Main.secondary1))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

struct ShowItemView_Previews: PreviewProvider {
    static var previews: some View {
        ShowItemView(show: ShowPreview(id: 1,
                                       name: "Under the Dome",
                                       genres: ["Action"],
                                       summary: "Lorem Ipsum",
                                       image: ImageInformation(medium: "https://static.tvmaze.com/uploads/images/medium_portrait/81/202627.jpg",
                                                               original: nil))
        )
        .padding(16)
    }
}
