//
//  GridLayout.swift
//  Search
//
//  Created by Mac on 10/3/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit

class GridLayout: UICollectionViewFlowLayout{
    
    private var numberofColumns: CGFloat = 3
    
    override init() {
        super.init()
        minimumLineSpacing = 2
        minimumInteritemSpacing = 2
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var itemSize: CGSize{
        get {
            return CGSize(width: itemWidth, height: itemHeight)
        } set{
            super.itemSize = newValue
        }
    }
    
    override func prepare() {
        super.prepare()
        headerReferenceSize = CGSize(width: collectionView!.frame.width, height: 30)
    }
    
    var itemWidth: CGFloat{
        return (collectionView!.frame.width / numberofColumns) - 2
    }
    
    var itemHeight: CGFloat{
        return itemWidth + 60
    }
    

    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint) -> CGPoint {
        return proposedContentOffset
    }
    
}


