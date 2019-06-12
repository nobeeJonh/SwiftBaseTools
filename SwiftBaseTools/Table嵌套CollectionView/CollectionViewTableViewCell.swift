//
//  CollectionViewTableViewCell.swift
//  SwiftBaseTools
//
//  Created by yons on 2019/6/11.
//  Copyright © 2019年 yons. All rights reserved.
//

import UIKit

class CollectionViewTableViewCell: UITableViewCell, RegisterCellFromNib {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    @IBOutlet weak var collectionH: NSLayoutConstraint!
    
    var titles = [String]() {
        didSet {
            collectionView.reloadData()
            collectionView.setNeedsLayout()
            let height = flowLayout.collectionViewContentSize.height
            collectionH.constant = height
        }
    }

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // 需要重新设置下当前cell的宽度，不然就是为xib中的宽度
        self.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: bounds.height)
        layoutIfNeeded()
        
        collectionView.dataSource = self
        collectionView.wk_registerCell(cell: CollectionViewContentCell.self)
        flowLayout.itemSize = CGSize(width: (UIScreen.main.bounds.width - 60) * 0.2, height: 40)
        flowLayout.minimumInteritemSpacing = 10
        flowLayout.minimumLineSpacing = 10
        flowLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

// MARK: - UICollectionViewDataSource
extension CollectionViewTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.wk_dequeueReusableCell(indexPath: indexPath) as CollectionViewContentCell
        cell.contentLb.text = titles[indexPath.item]
        return cell
    }
  
}
