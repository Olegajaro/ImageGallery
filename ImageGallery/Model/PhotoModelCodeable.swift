//
//  Photo.swift
//  ImageGallery
//
//  Created by Олег Федоров on 16.02.2022.
//

import Foundation

// MARK: - Photo
struct PhotoModelCodeable: Codable {
    let albumID, id: Int16
    let title: String
    let url, thumbnailURL: String

    enum CodingKeys: String, CodingKey {
        case albumID = "albumId"
        case id, title, url
        case thumbnailURL = "thumbnailUrl"
    }
}
