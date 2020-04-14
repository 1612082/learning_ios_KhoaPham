//
//  ProductItemCell.swift
//  btSell
//
//  Created by HongDang on 1/3/20.
//  Copyright © 2020 HongDang. All rights reserved.
//

import UIKit

class ProductItemCell: UICollectionViewCell {
    
    @IBOutlet weak var ProductImg: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var price: UILabel!
    func BindData(_ product:Product){
        ProductImg.image = product.img
        name.text = product.name
        price.text = "\(product.price)"
    }
}
