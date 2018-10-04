//
//  SubTitleLabel.swift
//  Search
//
//  Created by Mac on 10/4/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit

@IBDesignable
class SubTitleLabel: TitleLabel{
    
    override func setup() {
        font = UIFont.SUB_TITLE_FONT
        textColor = UIColor.lightGray
        numberOfLines = 0
    }
    

}
