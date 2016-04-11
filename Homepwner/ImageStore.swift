//
//  ItemStore.swift
//  Homepwner
//
//  Created by Lincoln Sea on 4/10/16.
//  Copyright © 2016 Lincoln Sea. All rights reserved.
//

import UIKit
class ImageStore: NSObject {
    let cache = NSCache()
    
    func setImage(image: UIImage, forKey key: String) {
        cache.setObject(image, forKey: key)
    }
    
    func imageForKey(key: String) -> UIImage? {
        return cache.objectForKey(key) as? UIImage
    }
    
    func deleteImageForKey(key: String) {
        cache.removeObjectForKey(key)
    }
}
