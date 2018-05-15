//
//  ItemStore.swift
//  Homepwner
//
//  Created by 穆康 on 2018/5/2.
//  Copyright © 2018年 穆康. All rights reserved.
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
        if let index = allItems.index(of: item) {
            allItems.remove(at: index)
        }
    }
    
    func moveItem(fromIndex: Int, toIndex: Int) {
        if fromIndex == toIndex {
            return;
        }
        
        let movedItem = allItems[fromIndex]
        allItems.remove(at: fromIndex)
        allItems.insert(movedItem, at: toIndex)
    }
}
