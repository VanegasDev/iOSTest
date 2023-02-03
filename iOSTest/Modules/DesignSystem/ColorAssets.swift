//
//  ColorAssets.swift
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
protocol ColorAssetType {
    var name: String { get }
}

enum ColorAsset {
    // MARK: - Main
    enum Main: String, ColorAssetType {
        case primary1 = "primary-1"
        case primary2 = "primary-2"
        case secondary1 = "secondary-1"
        case complementary1 = "complementary-1"
        case complementary2 = "complementary-2"
        
        var name: String {
            self.rawValue
        }
    }
    
    // MARK: - Supplementary
    enum Supplementary: String, ColorAssetType {
        case black = "black"
        case white = "white"
        
        var name: String {
            self.rawValue
        }
    }
}
