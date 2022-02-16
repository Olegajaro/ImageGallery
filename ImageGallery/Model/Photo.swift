//
//  Photo.swift
//  ImageGallery
//
//  Created by Олег Федоров on 16.02.2022.
//

import Foundation

// MARK: - PhotoElement
struct Photo: Codable {
    let albumID, id: Int
    let title: String
    let url, thumbnailURL: URL

    enum CodingKeys: String, CodingKey {
        case albumID = "albumId"
        case id, title, url
        case thumbnailURL = "thumbnailUrl"
    }
}
