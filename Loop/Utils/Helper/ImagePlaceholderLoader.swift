//
//  TableViewCell.swift
//  Streachy Header Effect Starter Project
//
//  Created by Abhishek Verma on 04/04/18.
//  Copyright © 2018 Abhishek Verma. All rights reserved.
//

import UIKit
let imageCache = NSCache<AnyObject, AnyObject>()
class ImagePlaceholderLoader: UIImageView {
    var imageURL: URL?
    let activityIndicator = UIActivityIndicatorView()
    func loadImageWithUrl(_ url: URL) {
        activityIndicator.color = UIColor.loopSelectedStarGold
        addSubview(activityIndicator)
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        let a = "\(url)"
        imageURL = URL(string: a.replacingOccurrences(of: " ", with: ""))
        
        image = nil
        activityIndicator.startAnimating()
        // retrieves image if already available in cache
        if let imageFromCache = imageCache.object(forKey: url as AnyObject) as? UIImage {
            
            self.image = imageFromCache
            
            activityIndicator.stopAnimating()
            
            return
            
        }
        // image does not available in cache.. so retrieving it from url...
        
        DispatchQueue.global(qos: .background).async {
            
            URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                if error != nil {
                    //Print(error as Any)
                    DispatchQueue.main.async {
                        self.image = UIImage(named: "capitan")
                        self.activityIndicator.stopAnimating()
                    }
                    return
                    
                }
                DispatchQueue.main.async(execute: {
                    if let unwrappedData = data, let imageToCache = UIImage(data: unwrappedData) {
                        if self.imageURL == url {
                            self.image = imageToCache
                        }
                        imageCache.setObject(imageToCache, forKey: url as AnyObject)
                        self.activityIndicator.stopAnimating()
                    }
                    else {
                        if self.imageURL == url {
                            self.image = UIImage(named: "capitan")
                        }
                        self.activityIndicator.stopAnimating()
                    }
                })
                
            }).resume()
        }
        
    }
}
