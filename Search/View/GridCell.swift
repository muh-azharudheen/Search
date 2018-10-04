//
//  GridCell.swift
//  Search
//
//  Created by Mac on 10/3/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit
import SDWebImage

class GridCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var result: Media!{
        didSet{
            titleLabel.text = result.title
            imageView.sd_setImage(with: URL(string: result.imageURL ?? ""), placeholderImage: UIImage(named: "itunes-logo-2809"), options: .refreshCached, completed: nil)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backgroundColor = UIColor.white
    }

}
