//
//  PageLoaders.swift
//  TodoApp
//
//  Created by Cemal BAYRI on 5/3/20.
//  Copyright © 2020 Cemal BAYRI. All rights reserved.
//

import UIKit
import CoreData

struct MainPageBuilder {
    static func make() -> MainVC {
        let destinationVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainVC") as! MainVC
        destinationVC.viewModel = TodosViewModel()
        return destinationVC
    }
}

struct DetailPageBuilder {
    static func make(_ item: NSManagedObject? = nil) -> DetailVC {
        let destinationVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailVC") as! DetailVC
        destinationVC.viewModel = DetailViewModel()
        destinationVC.viewModel.itemForUpdate = item
        return destinationVC
    }
}
