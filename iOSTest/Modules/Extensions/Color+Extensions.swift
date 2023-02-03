//
//  Color+Extensions.swift
//  iOSTest
//
//  Created by Mario Vanegas on 3/2/23.
//

import Foundation
import SwiftUI

extension Color {
    init(_ asset: ColorAssetType) {
        self.init(asset.name)
    }
}
