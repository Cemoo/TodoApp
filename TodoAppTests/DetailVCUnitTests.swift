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

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testSave(_ item: Todo) {
        viewModel.save(Todo(name: "Test", id: UUID().uuidString, state: false))
        XCTAssert(view.routes.contains(.backtomain))
    }

}

class MockDetailView: DetailViewModelDelegate {
    
    var routes: [DetailRoutes] = []
    
    func handle(_ output: DetailOutput) {
        
    }
    
    func navigate(_ route: DetailRoutes) {
        routes.append(route)
    }
}
