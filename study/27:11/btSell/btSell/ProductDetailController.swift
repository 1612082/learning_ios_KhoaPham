//
//  ProductDetailController.swift
//  btSell
//
//  Created by HongDang on 1/6/20.
//  Copyright © 2020 HongDang. All rights reserved.
//

import UIKit

class ProductDetailController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var id:String?
    var product:Product?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //get data
        
        product = (arrProduct.filter { $0.id == id}).first
        //print(product?.name!)
//        img.image = filtered[0].img
    }


    @IBAction func addToCart(_ sender: UIButton) {
        var isNewProduct = true
        if Cart.count > 0 {
            for i in 0..<Cart.count {
                if Cart[i].id == product!.id {
                    Cart[i].quantity = product!.quantity
                    isNewProduct = false
                    break
                }
                if isNewProduct {
                    Cart.append(product!)
                }
            }
        } else {
            Cart.append(product!)
        }
        for i in Cart{
            print("\(i.id) \(i.quantity)")
        }
        
    }
    

}
extension ProductDetailController:UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ImageProductCell", for: indexPath) as! ImageProductCell
            cell.img.image = product?.img
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "NameProductCell", for: indexPath) as! NameProductCell
            cell.lbName.text = product?.name
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "QuantityProductCell", for: indexPath) as! QuantityProductCell
            cell.lbQuantity.text = "\(product?.quantity ?? 1)"
            cell.didChangeQuantity = { (sl) in
                self.product?.quantity = sl
                self.tableView.reloadData()
            }
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
