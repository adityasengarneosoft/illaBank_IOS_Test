//
//  List.swift
//  Ilabank_App
//
//  Created by A1502 on 26/04/22.
//

import Foundation

// MARK: - List
struct List: Codable {
    let imageHeader: [ImageHeader]?
    var countryList: [countryList]?

    enum CodingKeys: String, CodingKey {
        case imageHeader = "ImageHeader"
        case countryList = "Country"
    }
}
// MARK: - Country
struct countryList: Codable {
    var id: Int?
    var title: String?
    var countryDescription: String?
    var imageUser: String?

    enum CodingKeys: String, CodingKey {
        case id, title
        case countryDescription = "description"
        case imageUser
    }
}
// MARK: - ImageHeader
struct ImageHeader: Codable {
    var imagePath: String?
}
