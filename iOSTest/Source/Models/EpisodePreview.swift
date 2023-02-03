//
//  EpisodePreview.swift
//  iOSTest
//
//  Created by Mario Vanegas on 3/2/23.
//

import Foundation

struct EpisodePreview: Decodable, Identifiable {
    let id: Int
    let name: String
    let season: Int
    let image: ImageInformation?
}
