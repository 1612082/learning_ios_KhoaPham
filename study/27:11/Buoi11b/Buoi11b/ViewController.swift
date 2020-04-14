//
//  ViewController.swift
//  Buoi11b
//
//  Created by HongDang on 12/20/19.
//  Copyright © 2019 HongDang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var chuoi:String = "aaaaaa"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func btnGoToYellow(_ sender: UIButton) {
        let scene = self.view.window?.windowScene?.delegate as! SceneDelegate
        scene.GoToYellow(chuoi)
    }
    

}

