//
//  PageLoaders.swift
//  TodoApp
//
//  Created by Cemal BAYRI on 5/3/20.
//  Copyright © 2020 Cemal BAYRI. All rights reserved.
//

import UIKit

struct MainPageBuilder {
    static func make(_ viewModel: TodosViewModelProtocol) -> MainVC {
        let destinationVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainVC") as! MainVC
        destinationVC.viewModel = viewModel
        return destinationVC
    }
}

struct DetailPageBuilder {
    static func make(_ item: TodoItem? = nil) -> DetailVC {
        let destinationVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailVC") as! DetailVC
        return destinationVC
    }
}
