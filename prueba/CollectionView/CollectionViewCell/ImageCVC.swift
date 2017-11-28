//
//  ImageCVC.swift
//  prueba
//
//  Created by Alvaro Informática on 27/11/17.
//  Copyright © 2017 Alvaro Blazquez Montero. All rights reserved.
//

import UIKit
import Kingfisher

class ImageCVC: UICollectionViewCell {

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var actionButton: UIButton!
    /// Xib name
    static let XibName = "ImageCVC"
    /// Reuse Identifier of Cell
    static let ReuseIdentifier = "ImageCell"

    /// Item View Model of the `ImageCV`. When set the variable, call `bindViewModel()`
    var itemVM: ImageCVItemVM? {
        didSet {
            bindViewModel()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func bindViewModel() {
        guard let _itemVM = itemVM else {
            fatalError("BindViewModel does not has Model - ImageCVC")
        }
        let urlImage = URL(string: _itemVM.image)
        photoImageView.kf.setImage(with: urlImage)

        if _itemVM.hasSubtitle {
            subtitleLabel.text = _itemVM.subtitle
            subtitleLabel.isHidden = false
        } else {
            subtitleLabel.isHidden = true
        }

        if _itemVM.hasButton {
            actionButton.setTitle(_itemVM.button, for: .normal)
            actionButton.isHidden = false
        } else {
            actionButton.isHidden = true
        }
    }

}
