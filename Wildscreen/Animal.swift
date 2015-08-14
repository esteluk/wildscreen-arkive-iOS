//
//  Animal.swift
//  Wildscreen
//
//  Created by Nathan Wong on 14/08/2015.
//  Copyright (c) 2015 Rockpool Digital. All rights reserved.
//

import Foundation

class Animal {
    var name: String?
    var animalDescription: String?
    
    func load(dict: NSDictionary) -> Animal {
        self.name = dict.objectForKey("Name") as? String
        self.animalDescription = dict.objectForKey("Description") as? String
        
        return self
    }
    
    convenience init(dictionary: NSDictionary) {
        self.init()
        
        load(dictionary);
    }
}