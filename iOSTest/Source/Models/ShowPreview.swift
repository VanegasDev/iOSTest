//
//  ShowPreview.swift
//  iOSTest
//
//  Created by Mario Vanegas on 3/2/23.
//

import Foundation

struct ShowPreview: Decodable {
    let id: Int
    let name: String
    let genres: [String]
    let summary: String
    let image: ImageInformation?
}
