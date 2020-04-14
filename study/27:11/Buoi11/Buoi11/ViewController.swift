//
//  ViewController.swift
//  Buoi11
//
//  Created by HongDang on 12/16/19.
//  Copyright © 2019 HongDang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, YellowViewControllerDelegate {
    func doSomethingWith(data: String) {
        print(data)
    }
    

    let chuoi:String = "Hello World!"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "MainVCtoYellowVC") {
            let YellowVC = segue.destination as! YellowViewController
            YellowVC.chuoi = chuoi
            YellowVC.delegate = self
        }
    }


    @IBAction func gobtn(_ sender: Any) {
        // xac dinh story board
        //let scr:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)//nil la thu muc chinh
        //view
//        let YellowVC = storyboard?.instantiateViewController(withIdentifier: "YellowViewController") as! YellowViewController
//        //present
//        self.present(YellowVC, animated: true, completion: nil)
        self.performSegue(withIdentifier: "MainVCtoYellowVC", sender: self)
    }
    
}

