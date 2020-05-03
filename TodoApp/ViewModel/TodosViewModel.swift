//
//  TodosViewModel.swift
//  TodoApp
//
//  Created by Cemal BAYRI on 5/2/20.
//  Copyright © 2020 Cemal BAYRI. All rights reserved.
//

import Foundation

class TodosViewModel: TodosViewModelProtocol {
   
    var delegate: TodosViewModelDelegate?

    func getItems() {
        
    }
    
    func addNewItem() {
        delegate?.navigate(.addnew)
    }
    
    func editItem(with todoItem: TodoItem) {
        delegate?.navigate(.detail(TodoItem()))
    }
       
}

