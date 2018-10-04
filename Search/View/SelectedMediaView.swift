//
//  SelectedMediaView.swift
//  Search
//
//  Created by Mac on 10/3/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit

final class SelectedMediaView: BaseView, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{

    var heightConstraint: NSLayoutConstraint?
    
    var dataSource: [MediaType]? {
        didSet{
            collectionView.reloadData()
            let height = collectionView.collectionViewLayout.collectionViewContentSize.height
            heightConstraint?.constant = height > 40 ? height : 40
            placeHolderLabel.isHidden = (dataSource?.count ?? 0) > 0 ? true : false
            
            layoutIfNeeded()
        }
    }

    private lazy var collectionView: UICollectionView = {
        let layout = DGCollectionViewLeftAlignFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(SelectedMediaCell.self)
        cv.dataSource = self
        cv.delegate = self
        cv.backgroundColor = UIColor.white.withAlphaComponent(0.1)
        return cv
    }()
    
    private let label: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = ">"
        lbl.textColor = UIColor.lightGray
        return lbl
    }()
    
    private let placeHolderLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Select Media"
        lbl.textColor = UIColor.lightGray
        return lbl
    }()
    
    override func setup() {
        
        backgroundColor = UIColor.white
        layer.cornerRadius = 3
        clipsToBounds = true
        
        addSubview(label)
        label.setVerticalCenterToSuperView()
        label.setTrailingSpace(from: safeTrailing, with: 8)
        addSubview(collectionView)
        collectionView.anchor(leading: safeLeading, trailing: label.safeLeading, top: safeTop, bottom: safeBottom, padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 8))
        
        addSubview(placeHolderLabel)
        placeHolderLabel.setVerticalCenterToSuperView()
        placeHolderLabel.setLeadingSpace(from: safeLeading, with: 8)
        
        
        //MARK:- Height adjusting constraint
        heightConstraint = collectionView.heightAnchor.constraint(equalToConstant: 40)
        heightConstraint?.priority = UILayoutPriority(rawValue: 999)
        heightConstraint?.isActive = true
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: SelectedMediaCell = collectionView.dequeReusableCell(forIndexPath: indexPath)
        cell.media = dataSource![indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }
    
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let label = UILabel()
        label.text = dataSource![indexPath.item].entity.title
        label.sizeToFit()
        return CGSize(width: label.frame.width + 16, height: 30)
    }

    
}

class SelectedMediaCell: UICollectionViewCell{
    
    var media: MediaType!{
        didSet{
            label.text = media.entity.title
        }
    }
    
    private let label : UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor.white
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup(){
        addSubview(label)
        label.setCenterToSuperView()
        layer.cornerRadius = 10
        backgroundColor = UIColor.itunesBlue
        clipsToBounds = true
    }
    
}
