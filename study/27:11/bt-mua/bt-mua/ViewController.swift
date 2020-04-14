//
//  ViewController.swift
//  bt-mua
//
//  Created by HongDang on 12/9/19.
//  Copyright © 2019 HongDang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let rainDrop:UIImageView = UIImageView(frame: CGRect(x: 200, y: -70, width: 50, height: 60))
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //rainDrop.image = #imageLiteral(resourceName: "mua")
        //view.addSubview(rainDrop)
        createWater(X: 0)
        //createRain()
        
    }
    func createWater( X:Int)
    {
        let w:UIImageView = UIImageView(frame: CGRect(x: X, y: 10, width: 50, height: 60))
        w.image = #imageLiteral(resourceName: "mua")
        view.addSubview(w)
        Raining(rainDrop: w)
    }
    func createRain(){
        var index:Int = 0
        Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { (timer) in
            self.createWater(X: index*50)
            index += 1
            if CGFloat(index * 50) > (self.view.frame.width - 250){
                timer.invalidate()
            }
        }
    }
    var create = true
    func Raining(rainDrop:UIImageView){
        var index = 0
        Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { (timer) in
            
            rainDrop.frame.origin.y += 1
            if self.create == true { index += 1 }
            if index == 60 && self.create == true {
                self.createWater(X: Int(CGFloat.random(in: 0...self.view.frame.width-50)))
                //self.createRain()
            }
            if rainDrop.frame.origin.y > 500{
                rainDrop.frame.origin.y = -70
                rainDrop.frame.origin.x = CGFloat.random(in: 0...self.view.frame.width-50)
                //timer.invalidate()
                self.create = false
                //self.Raining(rainDrop: rainDrop)
            }
        }
    }
}

