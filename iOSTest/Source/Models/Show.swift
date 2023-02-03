//
//  Show.swift
//  iOSTest
//
//  Created by Mario Vanegas on 3/2/23.
//

import Foundation

struct Show: Decodable {
    let name: String
    let genres: [String]
    let schedule: ShowSchedule
    let image: ImageInformation?
    let summary: String
}

struct ShowSchedule: Decodable {
    let time: String
    let days: [String]
}
