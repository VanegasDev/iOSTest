//
//  Image+Extensions.swift
//  iOSTest
//
//  Created by Mario Vanegas on 3/2/23.
//

import Foundation
import SwiftUI

extension Image {
    init(_ asset: ImageAssetType) {
        self.init(asset.name)
    }
}
