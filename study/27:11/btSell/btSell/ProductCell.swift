//
//  ProductCell.swift
//  btSell
//
//  Created by HongDang on 1/2/20.
//  Copyright © 2020 HongDang. All rights reserved.
//

import UIKit

class ProductCell: UITableViewCell {

    @IBOutlet weak var ProductCollectionView: UICollectionView!
    var didChangeScreen:((_ id:String)->Void)! = nil
    var dataProd:[Product] = []
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        ProductCollectionView.delegate = self
        ProductCollectionView.dataSource = self
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension ProductCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
     
        return dataProd.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let itemcell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductItemCell", for:
            indexPath) as! ProductItemCell
        itemcell.BindData(dataProd[indexPath.row])
        
        return itemcell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("\(dataProd[indexPath.item].id)")

        if self.didChangeScreen != nil {
            self.didChangeScreen(dataProd[indexPath.item].id)
        }
    }
}
