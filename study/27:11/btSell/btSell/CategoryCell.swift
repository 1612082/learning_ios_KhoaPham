//
//  CategoryCell.swift
//  btSell
//
//  Created by HongDang on 1/2/20.
//  Copyright © 2020 HongDang. All rights reserved.
//

import UIKit

class CategoryCell: UITableViewCell {

    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    // call back function - closure
    var didChangeCategory:((_ cate:Int)->Void)! = nil
    
    
    var arrCategoryImg:[UIImage] = [ #imageLiteral(resourceName: "icon"),#imageLiteral(resourceName: "laptop"),#imageLiteral(resourceName: "smartphone-call")]
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
extension CategoryCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrCategoryImg.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let itemcell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryItemCell", for:
            indexPath) as! categoryItemCell
        //cell.backgroundColor = .blue
        itemcell.img.image = arrCategoryImg[indexPath.row]
        
        return itemcell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cate = indexPath.item
        print(cate)
        // goi closure
        
        if self.didChangeCategory != nil {
            
            self.didChangeCategory(cate)
        }
    }
    
}
