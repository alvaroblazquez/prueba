//
//  ProductCV.swift
//  prueba
//
//  Created by Alvaro Informática on 28/11/17.
//  Copyright © 2017 Alvaro Blazquez Montero. All rights reserved.
//
import SwiftyJSON

/// Keys for the JSON of ProductCV
enum ProductCVKey: String {
    case id, title, pvp, pvpDiscount, stars, image, offer, isFavourite, width, action, idAction
}

/// Model ProductCV
struct ProductCV {
    let id: Int
    let title: String
    let pvp: Double
    let pvpDiscount: Double
    let stars: Int
    let image: String
    let offer: String
    let isFavourite: Bool
    let width: Int
    let action: String
    let idAction: Int
}

extension ProductCV {
    /// Initialize ProductCV with JSON
    init (json: JSON) {
        self.id = json[ProductCVKey.id.rawValue].intValue
        self.title = json[ProductCVKey.title.rawValue].stringValue
        self.pvp = json[ProductCVKey.pvp.rawValue].doubleValue
        self.pvpDiscount = json[ProductCVKey.pvpDiscount.rawValue].doubleValue
        self.stars = json[ProductCVKey.stars.rawValue].intValue
        self.image = json[ProductCVKey.image.rawValue].stringValue
        self.offer = json[ProductCVKey.offer.rawValue].stringValue
        self.isFavourite = json[ProductCVKey.isFavourite.rawValue].boolValue
        self.width = json[ProductCVKey.width.rawValue].intValue
        self.action = json[ProductCVKey.action.rawValue].stringValue
        self.idAction = json[ProductCVKey.idAction.rawValue].intValue
    }
}
