//
//  ImageAssets.swift
//  iOSTest
//
//  Created by Mario Vanegas on 3/2/23.
//

import Foundation

/**
 The main purpose of this file is to prevent having raw assets names within the codebase
 and prevent typos or badnames.
 
 Also this file makes easier to rename the asset in case it would be necessary
 */
protocol ImageAssetType {
    var name: String { get }
}

enum ImageAsset {
    // MARK: - Icons
    enum Icon: String, ImageAssetType {
        case tvIcon = "tv-icon"
        
        var name: String {
            self.rawValue
        }
    }
}
