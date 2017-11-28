//
//  ProductCVC.swift
//  prueba
//
//  Created by Alvaro Informática on 27/11/17.
//  Copyright © 2017 Alvaro Blazquez Montero. All rights reserved.
//

import UIKit
import Kingfisher

/// Collection View Cell for ProductCVC
class ProductCVC: UICollectionViewCell {

    /// Xib name
    static let XibName = "ProductCVC"
    /// Reuse Identifier of Cell
    static let ReuseIdentifier = "ProductCell"

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var offerLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var starsLabel: UILabel!
    @IBOutlet weak var discountView: UIView!
    @IBOutlet weak var discountLabel: UILabel!
    @IBOutlet weak var pvpDiscountLabel: UILabel!
    
    /// Item View Model of the `ProductCV`. When set the variable, call `bindViewModel()`
    var itemVM: ProductCVItemVM? {
        didSet {
            bindViewModel()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    /// Bind ViewModel To View
    func bindViewModel() {
        guard let _itemVM = itemVM else {
            fatalError("BindViewModel does not has Model - ProductCVC")
        }

        self.titleLabel.text = _itemVM.title

        if _itemVM.hasDiscount {
            self.discountView.isHidden = false
            self.priceLabel.isHidden = true
            let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: "\(_itemVM.pvp) €")
            attributeString.addAttribute(NSAttributedStringKey.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
            self.pvpDiscountLabel.attributedText = attributeString
            self.discountLabel.text = "\(_itemVM.pvpDiscount) €"
        } else {
            self.discountView.isHidden = true
            self.priceLabel.isHidden = false
            self.priceLabel.text = "\(_itemVM.pvp) €"
        }

        self.starsLabel.text = getStringStars(number: _itemVM.stars)
        let urlImage = URL(string: _itemVM.image)
        photoImageView.kf.setImage(with: urlImage)

        if _itemVM.hasOffer {
            self.offerLabel.text = _itemVM.offer
            self.offerLabel.isHidden = false
        } else {
            self.offerLabel.isHidden = true
        }

        if _itemVM.isFavourite {
            self.favoriteButton.setImage(#imageLiteral(resourceName: "fav-on"), for: .normal)
        } else {
            self.favoriteButton.setImage(#imageLiteral(resourceName: "fav-off"), for: .normal)
        }

    }

    private func getStringStars(number: Int) -> String {
        switch number {
        case 0:
            return "☆☆☆☆☆"
        case 1:
            return "★☆☆☆☆"
        case 2:
            return "★★☆☆☆"
        case 3:
            return "★★★☆☆"
        case 4:
            return "★★★★☆"
        case 5:
            return "★★★★★"
        default:
            return "☆☆☆☆☆"
        }
    }

}
