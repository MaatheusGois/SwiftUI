//
//  Item.swift
//  todo-list-ui
//
//  Created by Matheus Silva on 05/05/20.
//  Copyright © 2020 Matheus Gois. All rights reserved.
//

import Foundation
import CoreData
import SwiftUI

@objc(Item)
public class Item: NSManagedObject, Identifiable {
    @NSManaged var itemID: UUID
    @NSManaged var itemDescription: String
    @NSManaged var checked: Bool
}


extension Item {
    public static func fetchAllItems() -> NSFetchRequest<Item> {
        let req: NSFetchRequest<Item> = NSFetchRequest<Item>(entityName: "Item")
        req.shouldRefreshRefetchedObjects = true
        return req
    }
}

