//
//  MyConcernCell.swift
//  swiftPro
//
//  Created by diyidan on 2019/5/29.
//  Copyright © 2019 fei. All rights reserved.
//

import UIKit

class MyConcernCell: UITableViewCell,RegisterCellOrNib {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var rightLab: UILabel!
    @IBOutlet weak var rightImageView: UIImageView!
    @IBOutlet weak var titlelab: UILabel!
    
    var myConcernsArr = [MyConcern](){
        didSet {
            
            collectionView.reloadData()
        }
    }
    var mycellModel : MyCellModel?{
        didSet{
            titlelab?.text = mycellModel?.text
            rightLab.text = mycellModel?.grey_text
        }
    }
    var concernModel : MyConcern?{
        didSet{
            rightLab.text = concernModel?.name
//            rightImageView
        }
    }

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.collectionViewLayout = MyConcernFlowLayout()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.ym_registerCell(cell: MyConcernCollectionViewCell.self)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}

extension MyConcernCell : UICollectionViewDelegate,UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myConcernsArr.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.ym_dequeueReusableCell(indexPath: indexPath) as MyConcernCollectionViewCell
        cell.concernmodel = myConcernsArr[indexPath.row]
        return cell
    }

}

class MyConcernFlowLayout: UICollectionViewFlowLayout {
    override func prepare() {
            // 每个cell 的大小
        itemSize = CGSize(width: 58, height: 74)
        minimumLineSpacing = 0 // 横向间距
        minimumInteritemSpacing = 0 // 纵向间距
        sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        scrollDirection = .horizontal
        
    }
}
