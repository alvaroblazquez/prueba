//
//  ImageCV.swift
//  prueba
//
//  Created by Alvaro Informática on 28/11/17.
//  Copyright © 2017 Alvaro Blazquez Montero. All rights reserved.
//

import SwiftyJSON

/// Keys for the JSON of ImageCV
enum ImageCVKey: String {
    case image, subtitle, button, width, action, idAction
}

/// Model ImageCV
struct ImageCV {
    let image: String
    let subtitle: String
    let button: String
    let width: Int
    let action: String
    let idAction: Int
}

extension ImageCV {
    /// Initialize ImageCV with JSON
    init (json: JSON) {
        self.image = json[ImageCVKey.image.rawValue].stringValue
        self.subtitle = json[ImageCVKey.subtitle.rawValue].stringValue
        self.button = json[ImageCVKey.button.rawValue].stringValue
        self.width = json[ImageCVKey.width.rawValue].intValue
        self.action = json[ImageCVKey.action.rawValue].stringValue
        self.idAction = json[ImageCVKey.idAction.rawValue].intValue
    }
}
