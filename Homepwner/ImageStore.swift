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
        let imageURL = imageURLForKey(key)
        // Convert to jpeg
        if let data = UIImageJPEGRepresentation(image, 0.5) {
            data.writeToURL(imageURL, atomically: true)
        }
    }
    
    func imageForKey(key: String) -> UIImage? {
        
        if let existingImage = cache.objectForKey(key) as? UIImage {
            return existingImage
        }
        let imageURL = imageURLForKey(key)
        guard let imageFromDisk = UIImage(contentsOfFile: imageURL.path!) else {
            return nil
        }
        
        cache.setObject(imageFromDisk, forKey: key)
        return imageFromDisk
    }
    
    func deleteImageForKey(key: String) {
        cache.removeObjectForKey(key)
        let imageURL = imageURLForKey(key)
        do {
            try NSFileManager.defaultManager().removeItemAtURL(imageURL)
        } catch let deleteError {
            print("Error removing the image from disk \(deleteError)")
        }
    
    }
    
    func imageURLForKey(key: String) -> NSURL {
        let documentsDirectories = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        let documentDirectory = documentsDirectories.first!
        return documentDirectory.URLByAppendingPathComponent(key)
    }
}
