//
//  TravoryData.swift
//  Travory
//
//  Created by Ervin Canigur on 11/30/20.
//  Copyright © 2020 Ashish Nare. All rights reserved.
//

import Foundation

struct TravoryModel: Codable {
    let id: Int
    let country: String
    let destination: String
    let location: String
    let lat: Double
    let long: Double
    let info: [String]
    let images: [String]
}
