//
//  MyConcernCollectionViewCell.swift
//  swiftPro
//
//  Created by diyidan on 2019/5/31.
//  Copyright © 2019 fei. All rights reserved.
//

import UIKit
import Kingfisher

class MyConcernCollectionViewCell: UICollectionViewCell,RegisterCellOrNib {

    @IBOutlet weak var megBtn: UIButton!
    @IBOutlet weak var nameLab: UILabel!
    @IBOutlet weak var vipImageView: UIImageView!
    @IBOutlet weak var iconImageView: UIImageView!
    var concernmodel : MyConcern? {
        didSet {
            nameLab.text = concernmodel?.name
            iconImageView.kf.setImage(with: URL(string: (concernmodel?.icon)!))
            if let isVip = concernmodel?.is_verify {
                vipImageView.isHidden = !isVip
            }
            if let msgTips = concernmodel?.tips {
                megBtn.isHidden = !msgTips
            }
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        megBtn.layer.borderWidth = 1
        megBtn.layer.borderColor = UIColor.white.cgColor
    }

}
