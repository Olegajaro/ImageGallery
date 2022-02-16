//
//  Cat.swift
//  ImageGallery
//
//  Created by Олег Федоров on 16.02.2022.
//

import Foundation

// MARK: - Cat
struct Cat: Codable {
    let weight: Weight
    let id, name: String?
    let referenceImageID: String?
    let image: Image
    
    enum CodingKeys: String, CodingKey {
        case weight, id, name
        case referenceImageID = "reference_image_id"
        case image
    }
}

// MARK: - Image
struct Image: Codable {
    let id: String?
    let width: Int?
    let height: Int?
    let url: String?
}

// MARK: - Weight
struct Weight: Codable {
    let imperial, metric: String
}

//struct Cat: Codable {
// https://api.thecatapi.com/v1/breeds?api_key=\(API_KEY)
//    let weight: Weight
//    let id, name: String
//    let cfaURL: String
//    let vetstreetURL: String
//    let vcahospitalsURL: String
//    let temperament, origin, countryCodes, countryCode: String
//    let catDescription, lifeSpan: String
//    let indoor, lap: Int
//    let altNames: String
//    let adaptability, affectionLevel, childFriendly, dogFriendly: Int
//    let energyLevel, grooming, healthIssues, intelligence: Int
//    let sheddingLevel, socialNeeds, strangerFriendly, vocalisation: Int
//    let experimental, hairless, natural, rare: Int
//    let rex, suppressedTail, shortLegs: Int
//    let wikipediaURL: String
//    let hypoallergenic: Int
//    let referenceImageID: String
//    let image: Image
//
//    enum CodingKeys: String, CodingKey {
//        case weight, id, name
//        case cfaURL = "cfa_url"
//        case vetstreetURL = "vetstreet_url"
//        case vcahospitalsURL = "vcahospitals_url"
//        case temperament, origin
//        case countryCodes = "country_codes"
//        case countryCode = "country_code"
//        case catDescription = "description"
//        case lifeSpan = "life_span"
//        case indoor, lap
//        case altNames = "alt_names"
//        case adaptability
//        case affectionLevel = "affection_level"
//        case childFriendly = "child_friendly"
//        case dogFriendly = "dog_friendly"
//        case energyLevel = "energy_level"
//        case grooming
//        case healthIssues = "health_issues"
//        case intelligence
//        case sheddingLevel = "shedding_level"
//        case socialNeeds = "social_needs"
//        case strangerFriendly = "stranger_friendly"
//        case vocalisation, experimental, hairless, natural, rare, rex
//        case suppressedTail = "suppressed_tail"
//        case shortLegs = "short_legs"
//        case wikipediaURL = "wikipedia_url"
//        case hypoallergenic
//        case referenceImageID = "reference_image_id"
//        case image
//    }
//}
//
//// MARK: - Image
//struct Image: Codable {
//    let id: String
//    let width, height: Int
//    let url: String
//}
//
//// MARK: - Weight
//struct Weight: Codable {
//    let imperial, metric: String
//}
