//
//  ActorDirectorCell.swift
//  Loop
//
//  Created by Sanjay Mali on 19/10/22.
//

import UIKit

class ActorDirectorCell: UICollectionViewCell {
    @IBOutlet weak var backgroundImage: ImagePlaceholderLoader!
    @IBOutlet weak var descriptionLbl: UILabel!
    static let indetifier = "ActorDirectorCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backgroundImage.loopshadow()
    }
    var director : Director?{
        didSet{
            guard let imgUrl = director?.pictureUrl else {return}
            guard let url = URL(string: imgUrl) else { return}
            self.descriptionLbl.text = director?.name
            self.backgroundImage.loadImageWithUrl(url)
        }
    }
    var cast : Cast?{
        didSet{
            guard let imgUrl = cast?.pictureUrl else {return}
            guard let url = URL(string: imgUrl) else { return}
            self.descriptionLbl.text = cast?.name
            self.backgroundImage.loadImageWithUrl(url)
        }
    }
}
