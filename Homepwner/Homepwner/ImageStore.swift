//
//  ImageStore.swift
//  Homepwner
//
//  Created by 穆康 on 2018/6/5.
//  Copyright © 2018年 穆康. All rights reserved.
//

import Foundation
import UIKit

class ImageStore {
    let cache = NSCache<AnyObject, AnyObject>()
    
    func setImage(image: UIImage, forKey key: NSString) {
        cache.setObject(image, forKey: key)
    }
    func imageForKey(key: NSString) -> UIImage? {
        return cache.object(forKey: key) as? UIImage
    }
    func deleteImageForKey(key: NSString) {
        cache.removeObject(forKey: key)
    }
}
