//
//  ViewController.swift
//  btSell
//
//  Created by HongDang on 1/2/20.
//  Copyright © 2020 HongDang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var dataPoduct:[Product] = []
    @IBOutlet weak var tableView: UITableView!
    var reloadCollection = false
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        dataPoduct = arrProduct
    }
    

}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "BannerCell", for: indexPath) as! BannerCell
            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
            // gan gia tri cho closure
            if cell.didChangeCategory != nil {
                print("closure != nil")
            }
            else {print("closure = nil")}
            cell.didChangeCategory = { (cate) in
                switch cate {
                case 0:
                    self.dataPoduct = dataTablet
                    self.reloadCollection = true
                case 1:
                    self.dataPoduct = dataLaptop
                    
                default:
                    self.dataPoduct = dataPhone
                    
                }
                self.tableView.reloadData()
            }
            if cell.didChangeCategory != nil {
                print("closure != nil")
            }
            else {print("closure = nil")}
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as! ProductCell
            cell.dataProd = dataPoduct
            cell.ProductCollectionView.reloadData()
            cell.didChangeScreen = { (id) in
                let Main_Storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                // VC
                let DetailVC = Main_Storyboard.instantiateViewController(withIdentifier: "ProductDetailController") as! ProductDetailController
                DetailVC.id = id
                
                // go to green
                self.navigationController?.pushViewController(DetailVC, animated: true)
            }
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       switch indexPath.section {
        case 0:
            return 300
        case 1:
            return 100
        default:
            return 800
        
        }
    }

}
