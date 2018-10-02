//
//  UIView-FrameAnchors.swift
//  Search
//
//  Created by Mac on 10/2/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit

extension UIView{
    
    var safeLeading: NSLayoutXAxisAnchor{
        return safeAreaLayoutGuide.leadingAnchor
    }
    
    var safeTrailing : NSLayoutXAxisAnchor{
        return safeAreaLayoutGuide.trailingAnchor
    }
    
    var safeTop: NSLayoutYAxisAnchor{
        return safeAreaLayoutGuide.topAnchor
    }
    
    var safeBottom: NSLayoutYAxisAnchor{
        return safeAreaLayoutGuide.bottomAnchor
    }
    
}
