//
//  ItemStore.swift
//  Homepwner
//
//  Created by Lincoln Sea on 4/3/16.
//  Copyright © 2016 Lincoln Sea. All rights reserved.
//

import UIKit

class ItemStore {
    var allItems = [Item]()
    
    func createItem() -> Item {
        let newItem = Item(random: true)
        allItems.append(newItem)
        return newItem
    }
    
    func removeItem(item: Item) {
        if let index = allItems.indexOf(item) {
            allItems.removeAtIndex(index)
        }
    }
    
    init() {
        for _ in 0..<5 {
            createItem()
        }
    }
}
