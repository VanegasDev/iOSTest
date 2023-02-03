//
//  Episode.swift
//  iOSTest
//
//  Created by Mario Vanegas on 3/2/23.
//

import Foundation

struct Episode: Decodable {
    let id: Int
    let name: String
    let season: Int
    let number: Int
    let summary: String
    let image: ImageInformation?
}
