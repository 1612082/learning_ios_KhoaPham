//
//  BannerCell.swift
//  btSell
//
//  Created by HongDang on 1/2/20.
//  Copyright © 2020 HongDang. All rights reserved.
//

import UIKit

class BannerCell: UITableViewCell {

    @IBOutlet weak var BannerCollectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    var arrBannerImg:[UIImage] = [#imageLiteral(resourceName: "e"), #imageLiteral(resourceName: "Unknown"), #imageLiteral(resourceName: "ee"), #imageLiteral(resourceName: "er"), #imageLiteral(resourceName: "ere")]
    var counter = 0
    var time = Timer()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        BannerCollectionView.delegate = self
        BannerCollectionView.dataSource = self
        pageControl.numberOfPages = arrBannerImg.count
        pageControl.currentPage = counter
        DispatchQueue.main.async {
            self.time = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.changeImg), userInfo: nil, repeats: true)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @objc func changeImg(){
        if counter < arrBannerImg.count {
            let index = IndexPath.init(item: counter, section: 0)
            self.BannerCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            pageControl.currentPage = counter
            counter += 1
            
        } else {
            
            let index = IndexPath.init(item: 0, section: 0)
            self.BannerCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            pageControl.currentPage = 0
            counter = 1
        }
    }

}
extension BannerCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrBannerImg.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let itemcell = collectionView.dequeueReusableCell(withReuseIdentifier: "bannerItemCell", for:
            indexPath) as! bannerItemCell
        //cell.backgroundColor = .blue
        itemcell.bannerImg.image = arrBannerImg[indexPath.row]
        return itemcell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //let size = BannerCollectionView.frame.size
        return CGSize(width: self.frame.width, height: BannerCollectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
}
