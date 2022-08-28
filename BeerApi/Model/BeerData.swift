//
//  Beer.swift
//  MvpStart
//
//  Created by Aidar Asanakunov on 5/8/22.
//

import Foundation
//MARK: - JSON key Struct
struct Beer: Codable, Equatable {
    var id: Int
    var name: String?
    var description: String?
    var imageURL: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case imageURL = "image_url"
    }
}
