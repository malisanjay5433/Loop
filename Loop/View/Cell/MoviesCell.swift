//
//  MoviesCell.swift
//  Loop
//
//  Created by Sanjay Mali on 19/10/22.
//

import UIKit

class MoviesCell: UITableViewCell {
    @IBOutlet weak var bannerImage: ImagePlaceholderLoader!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        bannerImage.loopshadow()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    var movie : MoviesModel?{
        didSet{
            self.movieNameLabel.text  = movie?.title ?? ""
            self.dateLabel.text = movie?.releaseDate ?? ""
            guard let imgUrl = movie?.posterUrl else {return}
            guard let url = URL(string: imgUrl) else { return}
            self.bannerImage.loadImageWithUrl(url)
        }
    }
}
extension UIImageView{
    func loopshadow(){
        self.layer.shadowOffset = CGSize(width: 2, height: 2)
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOpacity = 1.5
        self.layer.cornerRadius = 12
        self.layer.masksToBounds = true
    }
}
