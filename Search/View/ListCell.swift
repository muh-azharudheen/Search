//
//  ListCell.swift
//  Search
//
//  Created by Mac on 10/3/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit

class ListCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    var result: SearchResult!{
        didSet{
            titleLabel.text = result.title + "List"
        }
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        backgroundColor = UIColor.red
        
    }

}
