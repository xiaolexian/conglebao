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
        backgroundColor = UIColor.white
        
        // 图片
        pictureImage = UIImageView()
        let collectionViewWH = CGFloat(Int((MyScreenWith - 40) / 3))
        pictureImage.contentMode = .scaleAspectFit
        pictureImage.frame = CGRect(x: 0, y: 0, width: collectionViewWH, height: collectionViewWH)
        addSubview(pictureImage)
        
        // 边框
        boardImage = UIImageView()
        boardImage.image = UIImage(named: "boards")
         boardImage.contentMode = .scaleAspectFit
        boardImage.frame = pictureImage.frame
        boardImage.height = boardImage.height + 1
        addSubview(boardImage)
        
        // 边框
        lockImage = UIImageView()
        lockImage.contentMode = .scaleAspectFit
        lockImage.frame = CGRect(x: pictureImage.width - 27.5, y: pictureImage.height - 32, width: 27.5, height: 32)
        lockImage.height = lockImage.height + 1
        addSubview(lockImage)
        
     }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
