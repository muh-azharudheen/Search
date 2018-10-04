//
//  SearchResultController.swift
//  Search
//
//  Created by Mac on 10/3/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit

struct Hello {
    
    private var type: Entity
    var title : String{
        return type.title
    }
    var data : [SearchResult]
    
    init(entity: Entity, dict: [[String: AnyObject]]) {
        self.type = entity
        data = []
        for obj in dict{
            switch type{
            case .album:
                data.append(SearchResult(AlbumDict: obj))
            case .artist:
                data.append(SearchResult(ArtistDict: obj))
            case .book:
                data.append(SearchResult(BookDict: obj))
            case .movie:
                data.append(SearchResult(MovieDict: obj))
            case .musicVideo:
                data.append(SearchResult(musicVideoDict: obj))
            case .podcast:
                data.append(SearchResult(podCastDict: obj))
            case .song:
                data.append(SearchResult(songDict: obj))
            }
        }
        
    }
    
}



final class SearchResultsController: BaseController{
    
//    fileprivate var dataSource : [SearchResult] = SearchResult.getMockup()
    
    var dataSource  = [Hello]()
    
    var listlayout: ListLayout = {
        return ListLayout()
    }()
    
    var gridLayout: GridLayout = {
        return GridLayout()
    }()
    

    
    private lazy var collectionView: UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: gridLayout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = UIColor.yellow
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
        btn.setTitle("grid", for: .normal)
        btn.tag = 0
        return btn
    }()
    
    private let listBtn : UIButton = {
        let btn = UIButton()
        btn.setTitleColor(UIColor.blue, for: .normal)
        btn.setTitle("List", for: .normal)
        btn.tag = 1
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
        
        gridButton.addTarget(self, action: #selector(gridListTapped(_:)), for: .touchUpInside)
        listBtn.addTarget(self, action: #selector(gridListTapped(_:)), for: .touchUpInside)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.collectionViewLayout = gridLayout
        collectionView.reloadData()
    }
    
    
    @objc
    func gridListTapped(_ sender: UIButton){
        
        if sender.tag == 1 && collectionView.collectionViewLayout == gridLayout{
            setLayout(layout: listlayout)
        }
        if sender.tag == 0 && collectionView.collectionViewLayout == listlayout {
            setLayout(layout: gridLayout)
        }
        
        sender.isSelected = true
    }
    
    private func setLayout(layout: UICollectionViewFlowLayout){
        self.collectionView.collectionViewLayout.invalidateLayout()
        self.collectionView.setCollectionViewLayout(layout, animated: true) { (_) in
            self.collectionView.reloadData()
        }
    }
}

extension SearchResultsController: UICollectionViewDelegate, UICollectionViewDataSource{
    
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
        let controller = DetailController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader{
            let cell: HeaderCell = collectionView.dequeReusableview(with: kind, for: indexPath)
            return cell
        } else {
            assert(false, "Unexpected Element Kind")
        }
    }
}

class HeaderCell: UICollectionReusableView{
    
}





