//
//  ViewController.swift
//  Search
//
//  Created by Mac on 10/2/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit
import AVKit

class ViewController: BaseController{
    
    var entities : [MediaType] = MediaType.getEntities()
    var spinner: UIActivityIndicatorView?
    
    private var backGroundView: UIImageView = {
        let bgView = UIImageView()
        bgView.translatesAutoresizingMaskIntoConstraints = false
        bgView.image = UIImage(named: "bgImage")
        bgView.contentMode = .scaleAspectFill
        return bgView
    }()
    
    private let logoImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "itunes_logo")?.withRenderingMode(.alwaysTemplate)
        iv.tintColor = UIColor.white
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    
    private let topLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Search for a variety of content from the iTunes store; including iBooks, movies, podcasts, music, music videos, and audiobooks"
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.textAlignment = .center
        label.textColor = UIColor.white
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var textField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Search"
        tf.layer.cornerRadius = 3
        tf.tintColor = UIColor.itunesBlue
        tf.clipsToBounds = true
        tf.setLeftPaddingPoints(10)
        tf.setRightPaddingPoints(10)
        tf.backgroundColor = UIColor.white
        return tf
    }()
    
    private let searchLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Specify the parameter for the content to be searched"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.textColor = UIColor.white
        label.numberOfLines = 0
        return label
    }()
    
    private let entityView: SelectedMediaView = {
        let view = SelectedMediaView()
        view.isUserInteractionEnabled = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let submitButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Submit", for: .normal)
        btn.backgroundColor = UIColor.purple
        btn.layer.cornerRadius = 3
        btn.clipsToBounds = true
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    override func setupViews() {
        view.addSubview(backGroundView)
        backGroundView.anchor(leading: view.safeLeading,trailing: view.safeTrailing,top: view.safeTop,bottom: view.bottomAnchor)
        
        view.addSubview(logoImageView)
        logoImageView.setHorizontalCenterToSuperView()
        logoImageView.setTopSpace(from: view.safeTop, with: 60)
        
        view.addSubview(topLabel)
        topLabel.setHorizontalCenterToSuperView()
        topLabel.setTopSpace(from: logoImageView.bottomAnchor, with: 30)
        topLabel.setSize(with: CGSize(width: 310, height: 0))
        
        view.addSubview(textField)
        textField.anchor(leading: topLabel.leadingAnchor, trailing: topLabel.trailingAnchor, top: topLabel.bottomAnchor, bottom: nil, padding: UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0))
        textField.setSize(with: CGSize(width: 0, height: 50))
        
        view.addSubview(searchLabel)
        searchLabel.anchor(leading: topLabel.leadingAnchor, trailing: topLabel.trailingAnchor, top: textField.bottomAnchor, bottom: nil, padding: UIEdgeInsets(top: 5, left: 0, bottom: 0, right: 0))
        
        view.addSubview(entityView)
        entityView.anchor(leading: topLabel.leadingAnchor, trailing: topLabel.trailingAnchor, top: searchLabel.bottomAnchor, bottom: nil, padding: UIEdgeInsets(top: 30, left: 0, bottom: 0, right: 0))
        
        view.addSubview(submitButton)
        submitButton.setHorizontalCenterToSuperView()
        submitButton.setTopSpace(from: entityView.bottomAnchor, with: 30)
        submitButton.setSize(with: CGSize(width: 100, height: 45))
        submitButton.addTarget(self, action: #selector(submitBtnTapped), for: .touchUpInside)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(entityViewTapped))
        tap.numberOfTapsRequired = 1
        entityView.addGestureRecognizer(tap)
        
    }
    
    var service = MediaService()
    
    @objc
    private func submitBtnTapped(){
        guard let searchText = textField.text, searchText != "" else {
            print("Please enter search query")
            return
        }
        guard let media = entityView.dataSource else {
            print("please select atleast one media type")
            return
        }
        
        spinner = showLoader(view: self.view)
        
        service.getResult(with: searchText, types: media) { [weak self] (result) in
            self?.spinner?.dismissLoader()
            switch result{
            case .failure(let err):
                print("Error")
            case .success(let dict):
                let controller = SearchResultsController()
                controller.dataSource = dict
                self?.navigationController?.pushViewController(controller, animated: true)
            }
            
        }
    }
    

    


@objc
private func entityViewTapped(){
    print("Entity view tapped")
    print("Go to entity table controller")
    let vc = EntityTableController()
    vc.entities = entities
    vc.entitySelection = { [weak self] entities in
        self?.entities = entities
        self?.entityView.dataSource = entities.filter({$0.isSelected == true })
    }
    
    self.navigationController?.pushViewController(vc, animated: true)
}

//MARK:- Hide Navigation bar on first screen
override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    self.navigationController?.navigationBar.isHidden = false
}

override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.navigationController?.navigationBar.isHidden = true
}

}
