//
//  ItunesGradientView.swift
//  Search
//
//  Created by Mac on 10/2/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit

final class ItunesGradientView: BaseView{
    
    private let gradientLayer : CAGradientLayer = {
        let gl = CAGradientLayer()
        gl.colors = [UIColor.red.cgColor, UIColor.blue.cgColor]
        return gl
    }()
    
    override func setup() {
       layer.addSublayer(gradientLayer)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }

}
