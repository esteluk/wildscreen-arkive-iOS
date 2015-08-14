//
//  StatsManager.swift
//  Wildscreen
//
//  Created by Nathan Wong on 14/08/2015.
//  Copyright (c) 2015 Rockpool Digital. All rights reserved.
//

import UIKit

class StatsManager {
    
    var store = NSUserDefaults.standardUserDefaults()
    
    var upvoteCount: Int = 0 {
        didSet {
            store.setInteger(upvoteCount, forKey: "upvotes")
        }
    }
    var downvoteCount: Int = 0 {
        didSet {
            store.setInteger(downvoteCount, forKey: "downvotes")
        }
    }
    
    var totalCount: Int {
        return upvoteCount + downvoteCount
    }
    
    init() {
        upvoteCount = store.integerForKey("upvotes")
        downvoteCount = store.integerForKey("downvotes")
    }
}