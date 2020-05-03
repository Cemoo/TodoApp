//
//  MainVCTests.swift
//  MainVCTests
//
//  Created by Cemal BAYRI on 5/2/20.
//  Copyright © 2020 Cemal BAYRI. All rights reserved.
//

import XCTest
import CoreData
@testable import TodoApp

class MainVCTests: XCTestCase {
    
    private var view: MockView!
    private var viewModel: TodosViewModel!

    override func setUpWithError() throws {
        viewModel = TodosViewModel()
        view = MockView()
        viewModel.delegate = view
    }
    
    /**
        -   Tests routes for opening detail vc or not for adding new todo.
     */
    func testNavigateAddTodo() {
        viewModel.addNewItem()
        
        XCTAssert(view.routes.count == 1)
        XCTAssert(view.routes.contains(.addnew))
    }
    
    
    /**
     -   Tests getting todos from core data
     */
    func testGetTodos() {
        viewModel.getItems()
        
        XCTAssert(view.items.count > 0)
    }
    
    func testDeleteItem(_ id: String) {
       // "223B1DB5-80EF-4E06-8A3C-81F18A38D4DD"
        viewModel.delete(for: "223B1DB5-80EF-4E06-8A3C-81F18A38D4DD")
        XCTAssert(view.items.count == 2)
    }
}


class MockView: TodosViewModelDelegate {

    var routes: [TodoRoutes] = []
    var outputs: [TodosOutput] = []
    
    var items: [NSManagedObject] = []
    
    func handle(_ output: TodosOutput) {
        outputs.append(output)
        switch output {
        case .showData(let items):
            self.items = items
        default:
            break
        }
    }
    
    func navigate(_ route: TodoRoutes) {
        routes.append(route)
    }
}
