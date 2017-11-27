//
//  MainCVC.swift
//  prueba
//
//  Created by Alvaro Informática on 27/11/17.
//  Copyright © 2017 Alvaro Blazquez Montero. All rights reserved.
//

import UIKit

enum MainCollectionView {
    case products, images
}

class MainCVC: UIView {

    /// Xib name
    static let XibName = "MainCVC"

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var actionButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet var contentView: UIView!

    var type = MainCollectionView.products

    init(frame: CGRect, delegate: UIViewController, type: MainCollectionView) {
        super.init(frame: frame)
        self.type = type
        commonInit()
        prepareCollectionView(delegate: delegate)
    }

    init(frame: CGRect, delegate: UIViewController) {
        super.init(frame: frame)
        commonInit()
        prepareCollectionView(delegate: delegate)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    private func commonInit() {
        Bundle.main.loadNibNamed(MainCVC.XibName, owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }

    private func prepareCollectionView(delegate: UIViewController) {
        switch self.type {
        case .products:
            let nib = UINib(nibName: ProductCVC.XibName, bundle: nil)
            collectionView.register(nib, forCellWithReuseIdentifier: ProductCVC.ReuseIdentifier)
        case .images:
            let nib = UINib(nibName: ImageCVC.XibName, bundle: nil)
            collectionView.register(nib, forCellWithReuseIdentifier: ImageCVC.ReuseIdentifier)
        }
        collectionView.delegate = self
        collectionView.dataSource = delegate as? UICollectionViewDataSource
    }
    
    @IBAction func actionTouch(_ sender: Any) {
        print("algo")
    }

}



extension MainCVC: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {

    func collectionView(cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell: UICollectionViewCell
        switch self.type {
        case .products:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCVC.ReuseIdentifier, for: indexPath) as! ProductCVC
        case .images:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCVC.ReuseIdentifier, for: indexPath) as! ImageCVC
        }

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.width/2.5, height: self.collectionView.frame.height)
    }

}
