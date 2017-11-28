//
//  ImageCVItemVM.swift
//  prueba
//
//  Created by Alvaro Informática on 28/11/17.
//  Copyright © 2017 Alvaro Blazquez Montero. All rights reserved.
//

/// Protocol for View Model with `ImageCV` as Item
protocol ImageCVItemVMProtocol {

    var image: String {get}
    var subtitle: String {get}
    var hasSubtitle: Bool {get}
    var button: String {get}
    var hasButton: Bool {get}
    var width: Int {get}
    /// ImageCV action onClick
    var action: String {get}
    var idAction: Int {get}
    init(_ imageCV: ImageCV)
}

/// Implementation of `ImageCVItemVMProtocol`
struct ImageCVItemVM: ImageCVItemVMProtocol {
    /// Item ImageCV
    let imageCV: ImageCV

    var image: String {
        return imageCV.image
    }
    var subtitle: String {
        return imageCV.subtitle
    }
    var hasSubtitle: Bool {
        return imageCV.subtitle != ""
    }
    var button: String {
        return imageCV.button
    }
    var hasButton: Bool {
        return imageCV.button != ""
    }
    var width: Int {
        return imageCV.width > 0 ? imageCV.width : 35
    }
    var action: String {
        return imageCV.action
    }
    var idAction: Int {
        return imageCV.idAction
    }
    /// Creates a `ImageCVItemVM` instance with the Image
    init(_ imageCV: ImageCV) {
        self.imageCV = imageCV
    }
}
