//
//  ProductCVC.swift
//  prueba
//
//  Created by Alvaro Informática on 27/11/17.
//  Copyright © 2017 Alvaro Blazquez Montero. All rights reserved.
//

import UIKit

class ProductCVC: UICollectionViewCell {

    /// Xib name
    static let XibName = "ProductCVC"
    /// Reuse Identifier of Cell
    static let ReuseIdentifier = "ProductCell"

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var offerLabel: UILabel!
    @IBOutlet weak var starsView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
