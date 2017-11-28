//
//  ProductCVVM.swift
//  prueba
//
//  Created by Alvaro Informática on 28/11/17.
//  Copyright © 2017 Alvaro Blazquez Montero. All rights reserved.
//

/// Protocol for View Model with `ProductCV` as Item
protocol ProductCVItemVMProtocol {

    var id: Int {get}
    var title: String {get}
    var pvp: Double {get}
    var pvpDiscount: Double {get}
    /// Has Discount the ProductCV
    var hasDiscount: Bool {get}
    var stars: Int {get}
    /// ProductCV image path
    var image: String {get}
    var offer: String {get}
    /// Has Offer the ProductCV
    var hasOffer: Bool {get}
    var isFavourite: Bool {get}
    /// ProductCV width % in the parent view
    var width: Int {get}
    /// ProductCV action onClick
    var action: String {get}
    var idAction: Int {get}
    init(_ productCV: ProductCV)
}

/// Implementation of `ProductCVItemVMProtocol`
struct ProductCVItemVM: ProductCVItemVMProtocol {
    /// Item productCV
    let productCV: ProductCV

    var id: Int {
        return productCV.id
    }
    var title: String {
        return productCV.title
    }
    var pvp: Double {
        return productCV.pvp
    }
    var pvpDiscount: Double {
        return productCV.pvpDiscount
    }
    var hasDiscount: Bool {
        return productCV.pvpDiscount > 0
    }
    var stars: Int {
        return productCV.stars
    }
    var image: String {
        return productCV.image
    }
    var offer: String {
        return productCV.offer
    }
    var hasOffer: Bool {
        return productCV.offer != ""
    }
    var isFavourite: Bool {
        return productCV.isFavourite
    }
    var width: Int {
        return productCV.width > 0 ? productCV.width : 35
    }
    var action: String {
        return productCV.action
    }
    var idAction: Int {
        return productCV.idAction
    }
    /// Creates a `ProductCVItemVM` instance with the product
    init(_ productCV: ProductCV) {
        self.productCV = productCV
    }
}
