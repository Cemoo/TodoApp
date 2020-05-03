//
//  DetailVCUnitTests.swift
//  TodoAppTests
//
//  Created by Cemal BAYRI on 5/3/20.
//  Copyright © 2020 Cemal BAYRI. All rights reserved.
//

import XCTest
import CoreData
@testable import TodoApp

class DetailVCUnitTests: XCTestCase {
    
    private var view: MockDetailView!
    private var viewModel: DetailViewModel!

    override func setUpWithError() throws {
        viewModel = DetailViewModel()
        view = MockDetailView()
        viewModel.delegate = view
    }

    func testSave(_ item: Todo) {
        viewModel.save(Todo(name: "Test", id: UUID().uuidString, state: false))
        XCTAssert(view.routes.contains(.backtomain))
    }
    
}

class MockDetailView: DetailViewModelDelegate {
 
    var routes: [DetailRoutes] = []
    var outputs: [DetailOutput] = []
    
    func handle(_ output: DetailOutput) {
        outputs.append(output)
    }
     
    func navigate(_ route: DetailRoutes) {
        routes.append(route)
    }
}
