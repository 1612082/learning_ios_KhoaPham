//
//  ProductInCartCell.swift
//  btSell
//
//  Created by HongDang on 1/8/20.
//  Copyright © 2020 HongDang. All rights reserved.
//

import UIKit

class ProductInCartCell: UITableViewCell {

    @IBOutlet weak var nonProduct: UIView!
    
    @IBOutlet weak var listProduct: UIView!
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var heightNonProduct: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
