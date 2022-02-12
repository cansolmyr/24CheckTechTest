//
//  ProductListModel.swift
//  check24TechTest
//
//  Created by Can TOKER on 12.02.2022.
//  Copyright (c) 2022 Can TOKER. All rights reserved.


import UIKit

struct ProductListModel {

    struct Response: Decodable {
        var header: ListHeader
        var filters: [String]
        var products: [Product]
        
        struct ListHeader: Decodable {
            var headerTitle: String
            var headerDescription: String
        }
        struct Product: Codable {
            let name: String?
            let type: TypeEnum?
            let id: Int?
            let color: Color?
            let imageURL: String?
            let colorCode: String?
            let available: Bool?
            let releaseDate: Int?
            let productDescription, longDescription: String?
            let rating: Double?
            let price: Price?

            enum CodingKeys: String, CodingKey {
                case name, type, id, color, imageURL, colorCode, available, releaseDate
                case productDescription = "description"
                case longDescription, rating, price
            }
        }

        enum Color: String, Codable {
            case blue = "Blue"
            case green = "Green"
            case red = "Red"
            case yellow = "Yellow"
        }

        // MARK: - Price
        struct Price: Codable {
            let value: Double
            let currency: Currency
        }

        enum Currency: String, Codable {
            case eur = "EUR"
        }

        enum TypeEnum: String, Codable {
            case circle = "Circle"
            case hexagon = "Hexagon"
            case square = "Square"
            case triangle = "Triangle"
        }

        
	}

	struct ViewModel {
		// do someting...
	}
}
