//
//  UIColor-Ext.swift
//  Search
//
//  Created by Mac on 10/3/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit
extension UIColor{
    
    convenience init(r:CGFloat,g:CGFloat,b:CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1.0)
    }
    
    static var itunesGreen = UIColor(r: 86, g: 162, b: 185)
    static let itunesBlue = UIColor(r: 82, g: 148, b: 225)
    
}
