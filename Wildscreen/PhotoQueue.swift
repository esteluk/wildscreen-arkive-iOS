//
//  PhotoQueue.swift
//  Wildscreen
//
//  Created by Nathan Wong on 14/08/2015.
//  Copyright (c) 2015 Rockpool Digital. All rights reserved.
//

import Foundation

class PhotoQueue {
    var network = Networking()
    var queue = [ImageHolder]()
    
    var delegate: PhotoQueueProtocol?
    
    init() {
        morePhotos()
    }
    
    func morePhotos() {
        
        // Get some more photos from the network
        network.animals ({ (data) -> Void in
            for a in data {
                self.queue.append(ImageHolder(dictionary: a))
            }
            
            self.delegate?.queueLoaded()
        })
    }
    
    func nextImage() -> ImageHolder? {
        return queue.first
    }
}

protocol PhotoQueueProtocol {
    func queueLoaded()
}