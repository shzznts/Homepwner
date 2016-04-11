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
    let itemArchiveURL: NSURL = {
        let documentDirectories = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        let documentDirectory = documentDirectories.first!
        return documentDirectory.URLByAppendingPathComponent("items.archive")
    }()
    
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
    
    func saveChanges() -> Bool {
        print("Save items to: \(itemArchiveURL.path!)")
        return NSKeyedArchiver.archiveRootObject(allItems, toFile: itemArchiveURL.path!)
    }
    
    init() {
        if let archivedItems = NSKeyedUnarchiver.unarchiveObjectWithFile(itemArchiveURL.path!) as? [Item] {
            allItems += archivedItems
        }
    }
    
//    init() {
//        for _ in 0..<5 {
//            createItem()
//        }
//    }
}
