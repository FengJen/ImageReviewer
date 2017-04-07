//
//  ImageTableViewCell.swift
//  ImageReviewer
//
//  Created by 劉洧熏 on 2017/4/7.
//  Copyright © 2017年 伍智瑋. All rights reserved.
//

import UIKit

class ImageTableViewCell: UITableViewCell {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var insetDot: UIView!
    @IBOutlet weak var outsiteDot: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        setUpCell()
    }

    func setUpCell() {

        insetDot.layer.cornerRadius = (insetDot.bounds.width)/2
        outsiteDot.layer.cornerRadius = (outsiteDot.bounds.width)/2

        userImage.layer.cornerRadius = 10
    }

}
