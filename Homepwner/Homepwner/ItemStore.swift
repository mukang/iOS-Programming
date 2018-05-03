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
    
    init() {
        for _ in 0..<5 {
            createItem()
        }
    }
}
