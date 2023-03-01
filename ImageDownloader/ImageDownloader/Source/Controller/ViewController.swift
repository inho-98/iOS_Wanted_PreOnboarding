//
//  ViewController.swift
//  ImageDownloader
//
//  Created by 김인호 on 2023/03/01.
//

import UIKit

class ViewController: UIViewController, Downloadable {
    let imageURLs = [
        "https://wallpaperaccess.com/download/europe-4k-1369012",
        "https://wallpaperaccess.com/download/europe-4k-1318341",
        "https://wallpaperaccess.com/download/europe-4k-1379801",
        "https://wallpaperaccess.com/download/cool-lion-167408",
        "https://wallpaperaccess.com/download/ironman-hd-323408"
    ]

    @IBOutlet weak var firstImage: UIImageView!
    @IBOutlet weak var secondImage: UIImageView!
    @IBOutlet weak var thirdImage: UIImageView!
    @IBOutlet weak var fourthImage: UIImageView!
    @IBOutlet weak var fifthImage: UIImageView!
    var imageViews: [UIImageView] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageViews = [firstImage, secondImage, thirdImage, fourthImage, fifthImage]
    }

    @IBAction func loadButtonPressed(_ sender: UIButton) {
        let imageView = imageViews[sender.tag]
        let url = imageURLs[sender.tag]
        
        imageView.image = UIImage(systemName: "photo")
        
        startLoad(of: url) { data in
            DispatchQueue.main.async {
                imageView.image = UIImage(data: data)
            }
        }
    }
    
    @IBAction func loadAllButtonPressed(_ sender: UIButton) {
        for (imageView, url) in zip(imageViews, imageURLs) {
            imageView.image = UIImage(systemName: "photo")
            
            startLoad(of: url) { data in
                DispatchQueue.main.async {
                    imageView.image = UIImage(data: data)
                }
            }
        }
    }
}

