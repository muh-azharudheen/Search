//
//  EntityTableController.swift
//  Search
//
//  Created by Mac on 10/3/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit

final class EntityTableController: UITableViewController{
    
    var entities: [MediaType] = []

    
    var entitySelection: (([MediaType]) -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        tableView.register(UITableViewCell.self)
        title = "Select media Types"
        
        let btn = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneBtnTapped))
        navigationItem.rightBarButtonItem = btn
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entities.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UITableViewCell = tableView.dequeReusableCell(forIndexPath: indexPath)
        cell.textLabel?.text = entities[indexPath.row].entity.title
        cell.accessoryType = entities[indexPath.row].isSelected ? .checkmark : .none
        return cell
    }
    
    @objc
    private func doneBtnTapped(){
        entitySelection?(entities)
        self.navigationController?.popViewController(animated: true)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        entities[indexPath.item].isSelected.toggle()
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
}
