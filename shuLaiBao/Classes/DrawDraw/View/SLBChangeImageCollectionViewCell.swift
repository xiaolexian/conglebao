//
//  SLBChangeImageCollectionViewCell.swift
//  shuLaiBao
//
//  Created by liudeng on 16/1/21.
//  Copyright © 2016年 liudeng. All rights reserved.
//

import UIKit

class SLBChangeImageCollectionViewCell: UICollectionViewCell {
    /** 图片 */
    var pictureImage:UIImageView!
    var boardImage:UIImageView!
    var lockImage:UIImageView!

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.whiteColor()
        
        // 图片
        pictureImage = UIImageView()
        let collectionViewWH = CGFloat(Int((MyScreenWith - 40) / 3))
        pictureImage.contentMode = .ScaleAspectFit
        pictureImage.frame = CGRectMake(0, 0, collectionViewWH, collectionViewWH)
        addSubview(pictureImage)
        
        // 边框
        boardImage = UIImageView()
        boardImage.image = UIImage(named: "boards")
         boardImage.contentMode = .ScaleAspectFit
        boardImage.frame = pictureImage.frame
        boardImage.height = boardImage.height + 1
        addSubview(boardImage)
        
        // 边框
        lockImage = UIImageView()
        lockImage.contentMode = .ScaleAspectFit
        lockImage.frame = CGRectMake(pictureImage.width - 27.5, pictureImage.height - 32, 27.5, 32)
        lockImage.height = lockImage.height + 1
        addSubview(lockImage)
        
     }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
