//
//  PhotoQueue.swift
//  Wildscreen
//
//  Created by Nathan Wong on 14/08/2015.
//  Copyright (c) 2015 Rockpool Digital. All rights reserved.
//

import Foundation
import SDWebImage

class PhotoQueue {
    var network = Networking()
    var queue = [ImageHolder]()
    let imageFetcher = SDWebImagePrefetcher.sharedImagePrefetcher()
    
    var delegate: PhotoQueueProtocol?
    
    init() {
        morePhotos()
    }
    
    func morePhotos() {
        
        // Get some more photos from the network
        network.animals ({ (data) -> Void in
            for a in data {
                let i = ImageHolder(dictionary: a)
                self.queue.append(i)
                
                if let url = i.image!.imageUrl {
                    self.imageFetcher.prefetchURLs([url])
                }
            }
            
            self.delegate?.queueLoaded()
        })
    }
    
    func nextImage() -> ImageHolder? {
        return queue.first
    }
    
    func like() -> Void {
        if let image = queue.first!.image {
            network.upvote(image.id)
        }
        
        next()
    }
    
    func dislike() -> Void {
        if let image = queue.first!.image {
            network.downvote(image.id)
        }
        next()
    }
    
    func next() {
        queue.removeAtIndex(0)
        
        if count(queue) > 0 {
            delegate?.queueLoaded()
        } else {
            delegate?.queueEmpty()
        }
        
        if count(queue) < 5 {
//            morePhotos()
        }
    }
}

protocol PhotoQueueProtocol {
    func queueLoaded()
    func queueEmpty()
}