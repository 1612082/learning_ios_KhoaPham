//
//  QuantityProductCell.swift
//  btSell
//
//  Created by HongDang on 1/7/20.
//  Copyright © 2020 HongDang. All rights reserved.
//

import UIKit

class QuantityProductCell: UITableViewCell {


    @IBOutlet weak var lbQuantity: UILabel!

    
    @IBOutlet var btnColor: [UIButton]!
    var didChangeQuantity:((_ sl:Int) -> Void)! = nil
    override func awakeFromNib() {
        super.awakeFromNib()
        if didChangeQuantity == nil {
            print("nil true")
        }
        // Initialization code
        btnColor[0].backgroundColor = .black
        btnColor[1].backgroundColor = .red
        btnColor[2].backgroundColor = .white
        for btn in btnColor {
            btn.layer.cornerRadius = btn.frame.height/2
            btn.layer.borderColor = UIColor.blue.cgColor
            btn.layer.borderWidth = 2
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func clickNegative(_ sender: UIButton) {
        if didChangeQuantity == nil {
            //print("nil true")
        }
        var sl:Int = Int(lbQuantity.text!)!
        sl -= 1
        if sl > 0 {
            if didChangeQuantity != nil {
                didChangeQuantity(sl)
            }
        }
        
    }
    @IBAction func clickAdd(_ sender: UIButton) {
        var sl:Int = Int(lbQuantity.text!)!
        sl += 1
        if didChangeQuantity != nil {
            didChangeQuantity(sl)
        }
    }
    
}
