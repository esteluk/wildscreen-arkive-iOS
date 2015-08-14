//
//  ViewController.swift
//  Wildscreen
//
//  Created by Nathan Wong on 14/08/2015.
//  Copyright (c) 2015 Rockpool Digital. All rights reserved.
//

import SDWebImage
import UIKit

class ViewController: UIViewController, PhotoQueueProtocol {
    
    var queue = PhotoQueue()

    @IBOutlet weak var animalName: UILabel!
    @IBOutlet weak var animalDescription: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var dislikeButton: UIButton!
    @IBOutlet weak var likeButton: UIButton!
    
    @IBOutlet weak var finishedView: UIView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        queue.delegate = self
        load(queue.nextImage())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func load(imageHolder: ImageHolder?) {
        
        if imageHolder != nil {
            animalName.text = imageHolder!.animal?.name
            animalDescription.text = imageHolder!.animal?.animalDescription
        
            if let image = imageHolder!.image {
                imageView.sd_setImageWithURL(NSURL(string: image.imageUrl!))
            }
            
            likeButton.enabled = true
            dislikeButton.enabled = true
        } else {
            animalName.text = nil
            animalDescription.text = nil
            imageView.image = nil
            
            likeButton.enabled = false
            dislikeButton.enabled = false
        }
    }

    // MARK: - PhotoQueueProtocol methods
    func queueLoaded() {
        // Reload data
        
        load(queue.nextImage())
        
        self.finishedView.hidden = true
        activityIndicator.stopAnimating()

    }
    
    func queueEmpty() {
        self.finishedView.hidden = false
        load(nil)
    }
    
    // MARK: - IBActions methods

    @IBAction func dislike(sender: UIButton) {
        queue.dislike()
    }
    
    @IBAction func like(sender: UIButton) {
        queue.like()
    }
    
    @IBAction func loadMore(sender: AnyObject) {
        activityIndicator.startAnimating()
        activityIndicator.hidden = false
        queue.morePhotos()
    }
}

