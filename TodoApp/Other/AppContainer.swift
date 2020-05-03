//
//  AppContainer.swift
//  TodoApp
//
//  Created by Cemal BAYRI on 5/3/20.
//  Copyright © 2020 Cemal BAYRI. All rights reserved.
//

import UIKit

//let app = AppContainer()

final class AppContainer {
    
    private let window: UIWindow
    
    init(_ window: UIWindow) {
        self.window = window
    }

    func start() {
        let router = AppRouter(self.window)
        router.start()
    }
   
    
}
