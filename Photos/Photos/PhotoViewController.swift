//
//  PhotoViewController.swift
//  Photos
//
//  Created by Xinran Guo on 11/16/15.
//  Copyright © 2015 iOS DeCal. All rights reserved.
//

import Foundation
import UIKit

class PhotoViewController: UIViewController {
    
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var numLikes: UILabel!
    @IBOutlet weak var heartButton: UIImageView!
    @IBOutlet weak var postDate: UILabel!
    var photo:Photo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        postDate.text = photo!.date
        author.text = photo!.username
        numLikes.text = String(photo!.likes)
        if let data = NSData(contentsOfURL: NSURL(string: photo!.url)!) {
            image.image = UIImage(data: data)
        }
        heartButton.image = UIImage(named: "heartGrey.png")
        heartButton.userInteractionEnabled  = true
        heartButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action:Selector("likes")))
    }
    
    func likes() {
        if (photo!.isLiked) {
            photo!.isLiked = false
            heartButton.image = UIImage(named: "heartGrey.png")
            numLikes.text = String(photo!.likes)
        } else {
            photo!.isLiked = true
            heartButton.image = UIImage(named: "heartRed.png")
            numLikes.text = String(photo!.likes + 1)
        }
    }
}