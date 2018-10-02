//
//  SearchResultController.swift
//  Search
//
//  Created by Mac on 10/3/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit

final class SearchResultsController: BaseController{
    
    private lazy var collectionView: UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = UIColor.blue
        return cv
    }()
    
    private let gridButton: UIButton = {
        let btn = UIButton()
        btn.setTitleColor(UIColor.blue, for: .normal)
        btn.setTitle("grid", for: .normal)
        return btn
    }()
    
    private let listBtn : UIButton = {
        let btn = UIButton()
        btn.setTitleColor(UIColor.blue, for: .normal)
        btn.setTitle("List", for: .normal)
        return btn
    }()
    
    override func setupViews() {
        let stackView = UIStackView(arrangedSubviews: [gridButton,listBtn])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        view.addSubview(stackView)
        
        stackView.anchor(leading: view.safeLeading, trailing: view.safeTrailing, top: view.safeTop, bottom: nil)
        
        view.addSubview(collectionView)
        collectionView.anchor(leading: view.safeLeading, trailing: view.safeTrailing, top: stackView.bottomAnchor, bottom: view.safeBottom)
        
    }
    
    
    
    
}
