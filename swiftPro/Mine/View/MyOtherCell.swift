//
//  MyOtherCell.swift
//  swiftPro
//
//  Created by diyidan on 2019/5/29.
//  Copyright © 2019 fei. All rights reserved.
//

import UIKit

class MyOtherCell: UITableViewCell,RegisterCellOrNib {

    @IBOutlet weak var subTitleLab: UILabel!
    @IBOutlet weak var titleLab: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
