//
//  TodosViewModel.swift
//  TodoApp
//
//  Created by Cemal BAYRI on 5/2/20.
//  Copyright © 2020 Cemal BAYRI. All rights reserved.
//

import UIKit
import CoreData

final class TodosViewModel: TodosViewModelProtocol {
   
    weak var delegate: TodosViewModelDelegate?
    
    var todos: [NSManagedObject] = []
    
    func getItems() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "TodoItem")
        do {
            let todoItems = try managedContext.fetch(fetchRequest)
            self.todos = todoItems
            self.delegate?.handle(.showData(self.todos))
        } catch {
            self.delegate?.handle(.showError("Error while fetching todo items"))
        }
    }
    
    func addNewItem() {
        delegate?.navigate(.addnew)
    }
    
    func editItem(with todoItem: NSManagedObject) {
        delegate?.navigate(.detail(todoItem))
    }
    
    func delete(for id: String) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "TodoItem")
        
        fetchRequest.predicate = NSPredicate(format: "id == %@", id)
        
        do {
            let items = try managedContext.fetch(fetchRequest)
            items.forEach { (item) in
                managedContext.delete(item)
            }
            try managedContext.save()
            self.getItems()
        } catch  {
            self.delegate?.handle(.showError("Error while deleting todo item"))
        }
    }
       
}

