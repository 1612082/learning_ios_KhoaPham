//
//  YellowViewController.swift
//  Buoi11
//
//  Created by HongDang on 12/16/19.
//  Copyright © 2019 HongDang. All rights reserved.
//

import UIKit
protocol YellowViewControllerDelegate : NSObjectProtocol{
    func doSomethingWith(data: String)
}
class YellowViewController: UIViewController {
    var chuoi:String = ""
    let Name:String = "Quan Nguyen"
    weak var delegate : YellowViewControllerDelegate?
    @IBOutlet weak var lb: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        lb.text = chuoi
        
    }
    
    @IBAction func Backbtn(_ sender: Any) {
//        self.dismiss(animated: true, completion: nil)
        self.delegate?.doSomethingWith(data: Name)
        
    }
    
    

}
