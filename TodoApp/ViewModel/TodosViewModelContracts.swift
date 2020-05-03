//
//  TodosViewModelContract.swift
//  TodoApp
//
//  Created by Cemal BAYRI on 5/2/20.
//  Copyright © 2020 Cemal BAYRI. All rights reserved.
//

import Foundation

//MARK: - View Model Protocol
protocol TodosViewModelProtocol: class {
    var delegate: TodosViewModelDelegate? {get set}
    func getItems()
    func addNewItem()
    func editItem(with todoItem: TodoItem)
}

//MARK: - Output Delegate
protocol TodosViewModelDelegate {
    func handle(_ output: TodosOutput)
    func navigate(_ route: TodoRoutes)
}

enum TodosOutput: Equatable {
    case showLoading(Bool)
    case showData
    case showError(String)
    case updateTitle(String)
}

//MARK: - Routes
enum TodoRoutes: Equatable {
    case detail(TodoItem)
    case addnew
}






