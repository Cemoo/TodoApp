//
//  DetailViewModel.swift
//  TodoApp
//
//  Created by Cemal BAYRI on 5/3/20.
//  Copyright © 2020 Cemal BAYRI. All rights reserved.
//

import UIKit
import CoreData

final class DetailViewModel: DetailViewModelProtocol {

    weak var delegate: DetailViewModelDelegate?
    
    var type: ProcessType = .save 
    
    var itemForUpdate: NSManagedObject?
    
    func setInitials() {
        if type == .save {
            self.delegate?.handle(.updateButtonTitle("SAVE"))
            self.delegate?.handle(.setPageTitle("New Todo"))
        } else {
            if let item = self.itemForUpdate {
                self.delegate?.handle(.updateButtonTitle("UPDATE"))
                self.delegate?.handle(.fillName(item.value(forKey: "name") as! String))
                self.delegate?.handle(.setPageTitle("Edit Todo"))
            }
        }
    }
    
    func save(_ item: Todo) {
        if type == .save {
            add(item)
        } else {
            update(item.name, itemForUpdate)
        }
        
    }
    
    fileprivate func add(_ item: Todo) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "TodoItem", in: managedContext)!
        let todoItem = NSManagedObject(entity: entity, insertInto: managedContext)
        
        todoItem.setValue(item.name, forKey: "name")
        todoItem.setValue(item.id, forKey: "id")
        todoItem.setValue(item.state, forKey: "state")
        
        do {
            try managedContext.save()
            self.delegate?.navigate(.backtomain)
        } catch let error as NSError {
            self.delegate?.handle(.showError(error.localizedDescription))
        }
    }
    
    func update(_ name: String, _ updatingItem: NSManagedObject?) {
        guard let item = updatingItem else {return}
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        item.setValue(name, forKey: "name")
        do {
            try managedContext.save()
            self.delegate?.navigate(.backtomain)
        } catch  {
            self.delegate?.handle(.showError(error.localizedDescription))
        }
    }
}
