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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        queue.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func load(imageHolder: ImageHolder) {
        animalName.text = imageHolder.animal?.name
        animalDescription.text = imageHolder.animal?.animalDescription
        
        if let image = imageHolder.image {
            imageView.sd_setImageWithURL(NSURL(string: image.imageUrl!))
        }
    }

    // MARK: - PhotoQueueProtocol methods
    func queueLoaded() {
        // Reload data
        
        if let next = queue.nextImage() {
            load(next)
        }
    }
    
    // MARK: - IBActions methods

    @IBAction func dislike(sender: UIButton) {
    }
    
    @IBAction func like(sender: UIButton) {
    }
}

