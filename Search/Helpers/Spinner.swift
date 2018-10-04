//
//  Spinner.swift
//  Search
//
//  Created by Mac on 10/4/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit


extension UIViewController{
    
    func showLoader(view: UIView) -> UIActivityIndicatorView {
        //Customize as per your need
        let spinner = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 40, height:40))
        spinner.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        spinner.layer.cornerRadius = 3.0
        spinner.clipsToBounds = true
        spinner.hidesWhenStopped = true
        spinner.style = .white
        spinner.center = view.center
        view.addSubview(spinner)
        spinner.startAnimating()
        UIApplication.shared.beginIgnoringInteractionEvents()
        return spinner
    }
}

extension UIActivityIndicatorView{
    func dismissLoader(){
        self.stopAnimating()
        self.removeFromSuperview()
        UIApplication.shared.endIgnoringInteractionEvents()
    }
}
