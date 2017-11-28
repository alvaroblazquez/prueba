//
//  CollectorViewController.swift
//  prueba
//
//  Created by Alvaro Informática on 27/11/17.
//  Copyright © 2017 Alvaro Blazquez Montero. All rights reserved.
//

import UIKit
import SwiftyJSON

class CollectorViewController: UIViewController {

    var mainCVC: MainCVC?
    var mainCVC2: MainCVC?
    var sliderCVC: SliderCVC?

    @IBOutlet weak var contentView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()


        //let decoder = JSONDecoder()

        let jsonString = "{\"id\": 1," +
            "\"title\": \"Colágeno con magnesio\"," +
            "\"pvp\": 22.49," +
            "\"pvpDiscount\": 14.99," +
            "\"stars\": 4," +
            "\"image\": \"https://d2mxwq0yq0jq8b.cloudfront.net/catalog/big/38047-amazin-foods-colageno-con-magnesio-450tabs.jpg\"," +
            "\"offer\": \"Destacado\"," +
            "\"isFavourite\": true," +
            "\"width\": 40," +
            "\"action\": \"showProduct\"," +
            "\"idAction\": \"1\"}"

        if let dataFromString = jsonString.data(using: .utf8, allowLossyConversion: false) {
            let json = try! JSON(data: dataFromString)

            let producto = ProductCV(json: json)

            print(producto.pvp)
        }

        //let obj: ProductCV = try! decoder.decode(ProductCV.self, from: json.data(using: .utf8)!)

        //print(obj)


        let frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height*0.5)
        mainCVC = MainCVC(frame: frame, delegate: self, type: .products)
        contentView.addSubview(mainCVC!)
        mainCVC?.titleLabel.text = "Ofertas del mes"
        mainCVC?.collectionView.reloadData()


        let frame2 = CGRect(x: 0, y: 400, width: self.view.frame.width, height: 500)
        mainCVC2 = MainCVC(frame: frame2, delegate: self, type: .images)
        contentView.addSubview(mainCVC2!)
        mainCVC2?.titleLabel.text = "Top Ventas"
        mainCVC2?.actionButton.isHidden = true
        mainCVC2?.collectionView.reloadData()

        let frame3 = CGRect(x: 0, y: 1000, width: self.view.frame.width, height: 302)
        let photoView = PhotoView(frame: frame3)
        contentView.addSubview(photoView)

        let frame4 = CGRect(x: 0, y: 910, width: self.view.frame.width, height: 500)
        sliderCVC = SliderCVC(frame: frame4, delegate: self)
        contentView.addSubview(sliderCVC!)
        sliderCVC?.collectionView.reloadData()

        // Do any additional setup after loading the view.
        //collectionView.reloadData()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension CollectorViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.mainCVC?.collectionView {
            let cell = self.mainCVC?.collectionView(cellForItemAt: indexPath)

            return cell!

        }
        if collectionView == self.sliderCVC?.collectionView {
            let cell = self.sliderCVC?.collectionView(cellForItemAt: indexPath)

            return cell!

        }
        let cell = self.mainCVC2?.collectionView(cellForItemAt: indexPath)

        return cell!


    }

    
}
