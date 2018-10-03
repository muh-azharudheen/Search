//
//  ReusableView.swift
//  Search
//
//  Created by Mac on 10/3/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit

protocol ReusableView : class{
    static var defaultReuseIdentifier: String { get }
}

protocol NibLoadableView: class {
    static var nibName: String { get }
}



extension ReusableView where Self : UIView {
    static var defaultReuseIdentifier : String{
        return NSStringFromClass(self)
    }
}
extension ReusableView where Self : UIViewController {
    static var defaultReuseIdentifier : String{
        return NSStringFromClass(self)
    }
}


extension NibLoadableView where Self: UIView {
    static var nibName: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}


extension UICollectionReusableView: ReusableView{}

extension UITableViewCell: ReusableView { }

extension UICollectionViewCell: NibLoadableView{}

extension UITableViewCell : NibLoadableView{}


extension UITableView{
    
    func register<T: UITableViewCell>(_ : T.Type){
        register(T.self, forCellReuseIdentifier: T.defaultReuseIdentifier)
    }
    
    func registerNib<T: UITableViewCell> (_ : T.Type){
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: T.nibName, bundle: bundle)
        register(nib, forCellReuseIdentifier: T.defaultReuseIdentifier)
    }
    
    func dequeReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.defaultReuseIdentifier, for: indexPath) as? T else {
            fatalError("could not deque cell with identifier \(T.defaultReuseIdentifier)")
        }
        return cell
    }
    
}


extension UICollectionView{
    
    func register<T: UICollectionViewCell>(_ : T.Type){
        register(T.self, forCellWithReuseIdentifier: T.defaultReuseIdentifier)
    }
    
    func registerNibLoadable<T: UICollectionViewCell> (_ : T.Type) {
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: T.nibName, bundle: bundle)
        register(nib, forCellWithReuseIdentifier: T.defaultReuseIdentifier)
    }
    
    func dequeReusableCell<T: UICollectionViewCell>(forIndexPath indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.defaultReuseIdentifier, for: indexPath) as? T else {
            fatalError("could not deque cell with identifier \(T.defaultReuseIdentifier)")
        }
        return cell
    }
    
    func register<T: UICollectionReusableView>(_ : T.Type, kind: String){
        register(T.self, forSupplementaryViewOfKind: kind, withReuseIdentifier: T.defaultReuseIdentifier)
    }
    
    func dequeReusableview<T: UICollectionReusableView>(with kind: String, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: T.defaultReuseIdentifier, for: indexPath) as? T else {
            fatalError("could not deque reusable view with identifier \(T.defaultReuseIdentifier)")
        }
        return cell
    }
    
}
