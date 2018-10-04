//
//  HeaderCell.swift
//  Search
//
//  Created by Mac on 10/4/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit


class HeaderCell: UICollectionReusableView{
    
    let label: UILabel = {
        let lbl = TitleLabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(label)
        label.setVerticalCenterToSuperView()
        label.setLeadingSpace(from: safeLeading, with: 8)
        backgroundColor = UIColor.lightGray
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
