//
//  ListLayout.swift
//  Search
//
//  Created by Mac on 10/3/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit

final class ListLayout: GridLayout{
    
    override var itemWidth: CGFloat{
        return collectionView!.frame.width
    }
    
    override var itemHeight: CGFloat{
        return 130
    }
    
}



