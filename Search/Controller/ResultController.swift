//
//  SearchResultController.swift
//  Search
//
//  Created by Mac on 10/3/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit
final class ResultController: BaseController{
    
    var dataSource  = [SearchResult]()
    
    var listlayout: ListLayout = {
        return ListLayout()
    }()
    
    var gridLayout: GridLayout = {
        return GridLayout()
    }()
    

    
    private lazy var collectionView: UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: gridLayout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = UIColor.white
        cv.registerNibLoadable(GridCell.self)
        cv.registerNibLoadable(ListCell.self)
        cv.register(HeaderCell.self, kind: UICollectionView.elementKindSectionHeader)
        cv.delegate = self
        cv.dataSource = self
        return cv
    }()
    
    private let gridButton: UIButton = {
        let btn = UIButton()
        btn.setTitleColor(UIColor.blue, for: .normal)
        btn.setTitle(Constants.Strings.gridLayout, for: .normal)
        btn.setImage(UIImage(named: "grid")?.withRenderingMode(.alwaysTemplate), for: .normal)
        btn.tintColor = UIColor.white
        btn.backgroundColor = UIColor.purple
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.tag = 0
        return btn
    }()
    
    private let listBtn : UIButton = {
        let btn = UIButton()
        btn.setTitleColor(UIColor.blue, for: .normal)
        btn.setTitle(Constants.Strings.listLayout, for: .normal)
        btn.setImage(UIImage(named: "list")?.withRenderingMode(.alwaysTemplate), for: .normal)
        btn.tintColor = UIColor.white
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.backgroundColor = UIColor.purple
        btn.tag = 1
        return btn
    }()
    
    override func setupViews() {
        let stackView = UIStackView(arrangedSubviews: [gridButton,listBtn])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.spacing = 2
        view.addSubview(stackView)
        
        stackView.anchor(leading: view.safeLeading, trailing: view.safeTrailing, top: view.safeTop, bottom: nil)
        
        view.addSubview(collectionView)
        collectionView.anchor(leading: view.safeLeading, trailing: view.safeTrailing, top: stackView.bottomAnchor, bottom: view.safeBottom)
        
        gridButton.addTarget(self, action: #selector(gridListTapped(_:)), for: .touchUpInside)
        listBtn.addTarget(self, action: #selector(gridListTapped(_:)), for: .touchUpInside)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.collectionViewLayout = gridLayout
        collectionView.reloadData()
        
        setupTitle()
    }
    
    private func setupTitle(){
        let logo = UIImage(named: "icons8-itunes-50")!
        let imageView = UIImageView(image: logo)
        self.navigationItem.titleView = imageView
    }
    
    
    @objc
    func gridListTapped(_ sender: UIButton){
        
        if sender.tag == 1 && collectionView.collectionViewLayout == gridLayout{
            setLayout(layout: listlayout)
        }
        if sender.tag == 0 && collectionView.collectionViewLayout == listlayout {
            setLayout(layout: gridLayout)
        }
    }
    
    private func setLayout(layout: UICollectionViewFlowLayout){
        self.collectionView.collectionViewLayout.invalidateLayout()
        self.collectionView.setCollectionViewLayout(layout, animated: true) { (_) in
            self.collectionView.reloadData()
        }
    }
}

extension ResultController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return dataSource.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource[section].data.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let data = dataSource[indexPath.section].data[indexPath.item]
        
        if  collectionView.collectionViewLayout == gridLayout {
            let cell: GridCell = collectionView.dequeReusableCell(forIndexPath: indexPath)
            cell.result = data
            return cell
        } else {
            let cell: ListCell = collectionView.dequeReusableCell(forIndexPath: indexPath)
            cell.result = data
            return cell
        }
     
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let media = dataSource[indexPath.section].data[indexPath.item]
        let controller = DetailController(media: media)
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader{
            let cell: HeaderCell = collectionView.dequeReusableview(with: kind, for: indexPath)
            cell.label.text = dataSource[indexPath.section].title
            return cell
        } else {
            assert(false, "Unexpected Element Kind")
        }
    }
}




