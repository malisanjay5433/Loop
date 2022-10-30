//
//  FavouritesCell.swift
//  Loop
//
//  Created by Raghvendra Reddy on 21/10/22.
//

import UIKit

class FavouritesCell: UICollectionViewCell {

    @IBOutlet weak var movieImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        movieImage.backgroundColor = .red
        movieImage.layer.cornerRadius = 8
        // Initialization code
    }

}
