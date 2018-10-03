//
//  UIView-Anchors.swift
//  Search
//
//  Created by Mac on 10/2/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit

extension UIView{
    
    func anchor(leading: NSLayoutXAxisAnchor?, trailing: NSLayoutXAxisAnchor?, top: NSLayoutYAxisAnchor?, bottom: NSLayoutYAxisAnchor?, padding: UIEdgeInsets = .zero){
        
        if let lead = leading{
            leadingAnchor.constraint(equalTo: lead, constant: padding.left).isActive = true
        }
        
        if let trail = trailing{
            trailingAnchor.constraint(equalTo: trail, constant: -padding.right).isActive = true
        }
        
        if let tp = top{
            topAnchor.constraint(equalTo: tp, constant: padding.top).isActive = true
        }
        
        if let btm = bottom{
            bottomAnchor.constraint(equalTo: btm, constant: -padding.bottom).isActive = true
        }
        
    }
    
    func setSize(with size: CGSize){
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
    
    func setCenterToSuperView(){
        if let sprview = superview{
            centerXAnchor.constraint(equalTo: sprview.centerXAnchor).isActive = true
            centerYAnchor.constraint(equalTo: sprview.centerYAnchor).isActive = true
        }
    }
    
    func setHorizontalCenterToSuperView(){
        if let sprView = superview{
            centerXAnchor.constraint(equalTo: sprView.centerXAnchor).isActive = true
        }
    }
    
    func setVerticalCenterToSuperView(){
        if let sprView = superview{
            centerYAnchor.constraint(equalTo: sprView.centerYAnchor).isActive = true
        }
    }
    
    func setTopSpace(from anchor: NSLayoutYAxisAnchor, with constant: CGFloat){
        topAnchor.constraint(equalTo: anchor,constant:constant).isActive = true
    }
    
    func setTrailingSpace(from anchor: NSLayoutXAxisAnchor, with constant: CGFloat){
        trailingAnchor.constraint(equalTo: anchor, constant: -constant).isActive = true
    }
    
    func setLeadingSpace(from anchor: NSLayoutXAxisAnchor, with constant: CGFloat){
        leadingAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
    }
    
}
