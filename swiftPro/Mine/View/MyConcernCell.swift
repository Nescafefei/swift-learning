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
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
