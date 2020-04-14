//
//  NewProductViewController.swift
//  btSell
//
//  Created by HongDang on 1/10/20.
//  Copyright © 2020 HongDang. All rights reserved.
//

import UIKit

class NewProductViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tfDanhMuc: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func clickDanhmuc(_ sender: UITextField) {
        tableView.isHidden = false
    }
    


}
extension NewProductViewController:UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DanhMuc.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DanhMucCell", for: indexPath) as! DanhMucCell
        
        cell.textLabel?.text = DanhMuc[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tfDanhMuc.text = DanhMuc[indexPath.row]
        tableView.isHidden = true
    }
    
}
