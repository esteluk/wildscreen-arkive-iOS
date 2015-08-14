//
//  Image.swift
//  Wildscreen
//
//  Created by Nathan Wong on 14/08/2015.
//  Copyright (c) 2015 Rockpool Digital. All rights reserved.
//

import Foundation

class Image {
    var animalId: Int?
    var createdOn: NSDate?
    var downVotes: Int = 0
    var imageId: Int = 0
    var imageUrl: String?
    var name: String?
    var upVotes: Int = 0
    
    func load(dict: NSDictionary) -> Image {
        self.animalId = dict.objectForKey("Animal_Id") as? Int
        self.name = dict.objectForKey("Name") as? String
        self.imageUrl = dict.objectForKey("ImageUrl") as? String
        self.imageId = dict.objectForKey("Id") as! Int
        
        return self
    }
    
    convenience init(dictionary: NSDictionary) {
        self.init()
        
        load(dictionary);
    }
}

class ImageHolder {
    var animal: Animal?
    var image: Image?
    
    func load(dict: NSDictionary) {
        self.animal = Animal(dictionary: dict.objectForKey("Animal") as! NSDictionary)
        self.image = Image(dictionary: dict.objectForKey("Image") as! NSDictionary)
    }
    
    init(dictionary: NSDictionary) {
        load(dictionary)
    }
}