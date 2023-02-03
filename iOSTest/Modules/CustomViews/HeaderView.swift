//
//  HeaderView.swift
//  iOSTest
//
//  Created by Mario Vanegas on 3/2/23.
//

import SwiftUI

struct HeaderView: View {
    let imageURL: String
    let title: String
    
    var body: some View {
        ZStack {
            VStack {
                Color(ColorAsset.Main.primary2)
                Spacer()
                    .frame(height: 35)
            }
            
            
            VStack {
                Spacer()
                    .frame(height: 35)
                HStack(alignment: .bottom) {
                    AsyncImage(url: URL(string: imageURL)) { image in
                        image.resizable()
                    } placeholder: {
                        VStack {
                            Spacer()
                            ProgressView()
                            Spacer()
                        }
                    }
                    .frame(width: 110)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    
                    Text(title)
                        .font(.title)
                        .foregroundColor(Color(ColorAsset.Supplementary.black))
                    
                    Spacer()
                }
            }
            .padding(.horizontal, 16)
        }
        .frame(height: 200)
        .shadow(radius: 16)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(imageURL: "https://static.tvmaze.com/uploads/images/medium_portrait/81/202627.jpg", title: "Lorem Ipsum")
    }
}
