//
//  SliderCVC.swift
//  prueba
//
//  Created by Alvaro Informática on 27/11/17.
//  Copyright © 2017 Alvaro Blazquez Montero. All rights reserved.
//

import UIKit

class SliderCVC: UIView {

    /// Xib name
    static let XibName = "SliderCVC"

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    init(frame: CGRect, delegate: UIViewController) {
        super.init(frame: frame)
        commonInit()
        prepareCollectionView(delegate: delegate)
        pageControl.numberOfPages = 5
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
        Bundle.main.loadNibNamed(SliderCVC.XibName, owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }

    private func prepareCollectionView(delegate: UIViewController) {
        let nib = UINib(nibName: ImageCVC.XibName, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: ImageCVC.ReuseIdentifier)
        collectionView.delegate = self
        collectionView.dataSource = delegate as? UICollectionViewDataSource
    }

}

extension SliderCVC: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {

    func collectionView(cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCVC.ReuseIdentifier, for: indexPath) as! ImageCVC
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.width, height: self.frame.height)
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }

}
