//
//  CartViewController.swift
//  btSell
//
//  Created by HongDang on 1/8/20.
//  Copyright © 2020 HongDang. All rights reserved.
//

import UIKit

class CartViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var lbQuantity: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        
    }



}
extension CartViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            if Cart.count == 0 {
                return 1
            } else {
                return Cart.count
            }
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "UserInfoCell", for: indexPath) as! UserInfoCell
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProductInCartCell", for: indexPath) as! ProductInCartCell
            if Cart.count == 0 {
                cell.nonProduct.isHidden = false
                cell.listProduct.isHidden = true
            } else {
                cell.nonProduct.isHidden = true
                cell.heightNonProduct.constant = 0
                cell.listProduct.isHidden = false
                cell.img.image = Cart[indexPath.row].img
            }
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "PaymentCell", for: indexPath) as! PaymentCell
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 1
        {
            return 200
        } else {
            return UITableView.automaticDimension
        }
        
    }
    
}
