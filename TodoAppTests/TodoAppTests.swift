//
//  TodoAppTests.swift
//  TodoAppTests
//
//  Created by Cemal BAYRI on 5/2/20.
//  Copyright © 2020 Cemal BAYRI. All rights reserved.
//

import XCTest
@testable import TodoApp

class TodoAppTests: XCTestCase {
    
    private var view: MockView!
    private var viewModel: TodosViewModel!

    override func setUpWithError() throws {
        viewModel = TodosViewModel()
        view = MockView()
        viewModel.delegate = view
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
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
       -   Tests routes for editing to detail vc or not for edting todo item.
    */
    func testEditTodo() {
        viewModel.editItem(with: TodoItem())
        
        XCTAssert(view.routes.contains(.detail))
    }
}


class MockView: TodosViewModelDelegate {

    var routes: [TodoRoutes] = []
    var outputs: [TodosOutput] = []
    
    func handle(_ output: TodosOutput) {
        outputs.append(output)
    }
    
    func navigate(_ route: TodoRoutes) {
        routes.append(route)
    }
}
