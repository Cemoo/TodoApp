//
//  DetailViewModelContracts.swift
//  TodoApp
//
//  Created by Cemal BAYRI on 5/3/20.
//  Copyright © 2020 Cemal BAYRI. All rights reserved.
//

import Foundation
import CoreData

enum ProcessType {
    case update, save
}

//MARK: - View Model Protocol
protocol DetailViewModelProtocol: class {
    var type: ProcessType {get set}
    var delegate: DetailViewModelDelegate? {get set}
    var itemForUpdate: NSManagedObject? {get set}
    
    func setInitials()
    func save(_ item: Todo)
    func update(_ name: String, _ updatingItem: NSManagedObject?)
}

//MARK: - Output Delegate
protocol DetailViewModelDelegate: class {
    func handle(_ output: DetailOutput)
    func navigate(_ route: DetailRoutes)
}

enum DetailOutput: Equatable {
    case showError(String)
    case updateButtonTitle(String)
    case fillName(String)
    case setPageTitle(String)
}

//MARK: - Routes
enum DetailRoutes: Equatable {
    case backtomain
}
