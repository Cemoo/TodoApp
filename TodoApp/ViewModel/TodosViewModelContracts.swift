//
//  TodosViewModelContract.swift
//  TodoApp
//
//  Created by Cemal BAYRI on 5/2/20.
//  Copyright © 2020 Cemal BAYRI. All rights reserved.
//

import Foundation
import CoreData

//MARK: - View Model Protocol
protocol TodosViewModelProtocol: class {
    var delegate: TodosViewModelDelegate? {get set}
    func getItems()
    func addNewItem()
    func editItem(with todoItem: NSManagedObject)
    func delete(for id: String)
    
    var todos: [NSManagedObject] {get set}
}

//MARK: - Output Delegate
protocol TodosViewModelDelegate: class {
    func handle(_ output: TodosOutput)
    func navigate(_ route: TodoRoutes)
}

enum TodosOutput: Equatable {
    case showLoading(Bool)
    case showData([NSManagedObject])
    case showError(String)
    case updateTitle(String)
}

//MARK: - Routes
enum TodoRoutes: Equatable {
    case detail(NSManagedObject)
    case addnew
}






