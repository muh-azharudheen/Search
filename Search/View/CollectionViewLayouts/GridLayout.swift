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
        minimumLineSpacing = 1
        minimumInteritemSpacing = 1
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
        headerReferenceSize = CGSize(width: collectionView!.frame.width, height: 20)
    }
    
    
//    override func prepare() {
//        super.prepare()
//
//        minimumInteritemSpacing = 1
//        minimumLineSpacing = 1
//        scrollDirection = .vertical
//        itemSize = CGSize(width: itemWidth, height: itemHeight)
//        headerReferenceSize = CGSize(width: collectionView!.frame.width, height: 20)
//    }
    
    var itemWidth: CGFloat{
        return (collectionView!.frame.width / numberofColumns) - 1
    }
    
    var itemHeight: CGFloat{
        return itemWidth
    }
    

    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint) -> CGPoint {
        return proposedContentOffset
    }
    
//    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint) -> CGPoint {
//        return collectionView!.contentOffset
//    }
    
}


