//
//  ActivityIndicatorModifier.swift
//  iOSTest
//
//  Created by Mario Vanegas on 3/2/23.
//

import SwiftUI

struct ActivityIndicatorModifier: ViewModifier {
    let isLoading: Bool
    
    func body(content: Content) -> some View {
        ZStack {
            content
            
            if isLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: Color(ColorAsset.Main.secondary1)))
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 5)
                            .opacity(0.5)
                    )
            }
        }
    }
}

extension View {
    func activityIndicator(isLoading: Bool) -> some View {
        self.modifier(ActivityIndicatorModifier(isLoading: isLoading))
    }
}
