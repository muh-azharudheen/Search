//
//  UIFont-Ext.swift
//  Search
//
//  Created by Mac on 10/4/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit

extension UIFont{
    
    static let TITLE_FONT = UIFont.systemFont(ofSize: 15, weight: .bold)
    static let SUB_TITLE_FONT = UIFont.systemFont(ofSize: 13, weight: .medium)
}


import UIKit

@IBDesignable
class ShadowView: UIView{
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupShadow()
    }
    
    private func setupShadow(){
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: -1, height: 1)
        self.layer.shadowRadius = 1
        
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shouldRasterize = true
        
        self.layer.rasterizationScale = UIScreen.main.scale
    }
    
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupShadow()
    }
    
}
