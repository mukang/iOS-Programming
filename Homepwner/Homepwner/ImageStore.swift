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
    
    func setImage(image: UIImage, forKey key: String) {
        cache.setObject(image, forKey: NSString(string: key))
        
        let imageURL = imageURLForKey(key: key)
        if let data = UIImageJPEGRepresentation(image, 0.5) {
            do {
                try data.write(to: imageURL)
            } catch {
                print(error)
            }
        }
    }
    
    func imageForKey(key: String) -> UIImage? {
        if let existingImage = cache.object(forKey: NSString(string: key)) as? UIImage {
            return existingImage
        }
        
        let imageURL = imageURLForKey(key: key)
        guard let imageFromDisk = UIImage(contentsOfFile: imageURL.path) else {
            return nil
        }
        
        cache.setObject(imageFromDisk, forKey: NSString(string: key))
        return imageFromDisk
    }
    
    func deleteImageForKey(key: String) {
        cache.removeObject(forKey: NSString(string: key))
        
        let imageURL = imageURLForKey(key: key)
        do {
            try FileManager.default.removeItem(at: imageURL)
        } catch let deleteError {
            print("Error removing the image from disk: \(deleteError)")
        }
    }
    
    func imageURLForKey(key: String) -> URL {
        let documentsDirctories = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = documentsDirctories.first!
        return documentDirectory.appendingPathComponent(key)
    }
}
