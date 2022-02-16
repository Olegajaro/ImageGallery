//
//  Cat.swift
//  ImageGallery
//
//  Created by Олег Федоров on 16.02.2022.
//

import Foundation

// MARK: - Cat
struct Cat: Codable {
    let id, name: String
    let referenceImageID: String
    let image: Image

    enum CodingKeys: String, CodingKey {
        case id, name
        case referenceImageID = "reference_image_id"
        case image
    }
}

// MARK: - Image
struct Image: Codable {
    let id: String
    let width: Int
    let height: Int
    let url: String
}
