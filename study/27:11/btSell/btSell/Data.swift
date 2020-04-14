//
//  Data.swift
//  btSell
//
//  Created by HongDang on 1/6/20.
//  Copyright © 2020 HongDang. All rights reserved.
//

import Foundation
import UIKit
struct User {
    let name:String
    let phone:String
    let addr:String
}
struct Product {
    let id:String
    let name:String
    let price:Int
    let img: UIImage
    let decription:String
    var quantity:Int
}
let DanhMuc:[String] = ["Sách","Điện tử","Nội thất","Giải trí", "Mẹ và bé"]
var Cart:[Product] = []
var dataPhone:[Product] = [
    Product(id: "1", name: "OPPO A5 (2020) 64GB", price: 4290000, img: #imageLiteral(resourceName: "oppo-a5-2020-1-400x460"), decription: "OPPO A5 (2020) 64GB là mẫu smartphone tầm trung với giá thành phải chăng nhưng được trang bị nhiều công nghệ hấp dẫn hứa hẹn sẽ lấy được lòng các bạn trẻ năng động, thời trang", quantity: 1),
    Product(id: "2", name: "Samsung Galaxy A20", price: 4190000, img: #imageLiteral(resourceName: "samsung-galaxy-a20-red-400x460"), decription: "Samsung Galaxy A20 là chiếc máy rẻ nhất trong dòng Galaxy A của Samsung mang lại cho người dùng những trải nghiệm cao cấp của những chiếc máy tới từ Samsung nhưng vẫn không phải bỏ ra số tiền quá lớn.", quantity: 1)
]
var dataTablet:[Product] = [
    Product(id: "3", name: "Samsung Galaxy Tab A8 8", price: 3690000, img: #imageLiteral(resourceName: "samsung-galaxy-tab-a8-t295-2019-silver-400x460"), decription: "Samsung Galaxy Tab A8 8 inch T295 (2019) là một chiếc máy tính bảng gọn nhẹ, với màn hình vừa đủ có thể giúp bạn giải trí hay hỗ trợ trẻ nhỏ trong việc học tập.", quantity: 1),
    Product(id: "4", name: "iPad 10.2 inch Wifi 32GB (2019)", price: 9990000, img: #imageLiteral(resourceName: "ipad-10-2-inch-wifi-32gb-2019-gold-400x460"), decription: "Thiết kế sang trọng, màn hình đẹp và một cấu hình đủ dùng cho hầu hết nhu cầu là những ưu điểm mà chiếc máy tính bảng iPad 10.2 inch Wifi 32GB (2019) này sở hữu.", quantity: 1)
]
var dataLaptop:[Product] = [
    Product(id: "5", name: "Apple MacBook Air 2017", price: 19990000, img: #imageLiteral(resourceName: "apple-macbook-air-mqd32sa-a-i5-5350u-600x600"), decription: "MacBook Air 2017 i5 128GB là mẫu laptop văn phòng, có thiết kế siêu mỏng và nhẹ, vỏ nhôm nguyên khối sang trọng. Máy có hiệu năng ổn định, thời lượng pin cực lâu 12 giờ, phù hợp cho hầu hết các nhu cầu làm việc và giải trí.", quantity: 1),
    Product(id: "6", name: "Asus VivoBook X507MA", price: 6990000, img: #imageLiteral(resourceName: "asus-x507ma-n4000-4gb-256gb-win10-br318t-10-600x600"), decription: "Laptop Asus X507MA (BR318T) là chiếc laptop văn phòng - học tập sở hữu thiết kế mỏng nhẹ, hoạt động nhanh mượt với ổ cứng SSD. Máy tính xách tay này còn được trang bị tính năng bảo mật bằng vân tay, giúp mở máy nhanh chóng và an toàn.", quantity: 1)

]
var arrProduct:[Product] = dataPhone + dataLaptop + dataTablet
var user:User = User(name: "Nguyễn Hungf Quân", phone: "0123456789", addr: "")
