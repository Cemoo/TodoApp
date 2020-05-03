//
//  AppRouter.swift
//  TodoApp
//
//  Created by Cemal BAYRI on 5/3/20.
//  Copyright © 2020 Cemal BAYRI. All rights reserved.
//

import UIKit

final class AppRouter {
    
    private let window: UIWindow
    
    init(_ window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let viewController = MainPageBuilder.make()
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.navigationBar.tintColor = .black
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
