//
//  TodoItem+CoreDataProperties.swift
//  TodoApp
//
//  Created by Cemal BAYRI on 5/3/20.
//  Copyright © 2020 Cemal BAYRI. All rights reserved.
//
//

import Foundation
import CoreData


extension TodoItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TodoItem> {
        return NSFetchRequest<TodoItem>(entityName: "TodoItem")
    }

    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var state: Bool
   

}
