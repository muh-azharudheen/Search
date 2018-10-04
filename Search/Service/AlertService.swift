//
//  AlerService.swift
//  Search
//
//  Created by Mac on 10/4/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit

class AlertService{
    static let instance = AlertService()
    
    func show(with title: String , message: String?, in controller: UIViewController){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: Constants.Strings.ok, style: .default, handler: nil)
        alertController.view.tintColor = UIColor.itunesBlue
        alertController.addAction(okAction)
        controller.present(alertController, animated: true, completion: nil)
    }
}

