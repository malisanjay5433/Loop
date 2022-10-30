//
//  MoviesCell.swift
//  Loop
//
//  Created by Sanjay Mali on 19/10/22.
//

import UIKit
protocol BookMarkTapDelegate {
    func tapBookMark(didClickedImageBookMark tableCell: MoviesCell)
}

class MoviesCell: UITableViewCell {
    @IBOutlet weak var bannerImage: ImagePlaceholderLoader!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var ratingImageView1: UIImageView!
    @IBOutlet weak var ratingImageView2: UIImageView!
    @IBOutlet weak var ratingImageView3: UIImageView!
    @IBOutlet weak var ratingImageView4: UIImageView!
    @IBOutlet weak var ratingImageView5: UIImageView!
    @IBOutlet weak var bookMark: UIButton!
    var delegate : BookMarkTapDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        bannerImage.loopshadow(radius:10)
        self.backgroundColor = UIColor.clear
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
            let rating = movie?.rating?.rounded()
            let rate = Int(rating ?? 0.0)
            ratingsSystem(rate:rate)
        }
    }
    func ratingsSystem(rate: Int){
        if rate == 5{
            self.ratingImageView1.image = UIImage(named:"starGold")
            self.ratingImageView2.image = UIImage(named:"starGold")
            self.ratingImageView3.image = UIImage(named:"starGold")
            self.ratingImageView4.image = UIImage(named:"starGold")
            self.ratingImageView5.image = UIImage(named:"starGold")
        }else if rate == 4{
            self.ratingImageView1.image = UIImage(named:"starGold")
            self.ratingImageView2.image = UIImage(named:"starGold")
            self.ratingImageView3.image = UIImage(named:"starGold")
            self.ratingImageView4.image = UIImage(named:"starGold")
            self.ratingImageView5.image = UIImage(named:"unselectedStar")
        }else if rate == 3{
            self.ratingImageView1.image = UIImage(named:"starGold")
            self.ratingImageView2.image = UIImage(named:"starGold")
            self.ratingImageView3.image = UIImage(named:"starGold")
            self.ratingImageView4.image = UIImage(named:"unselectedStar")
            self.ratingImageView5.image = UIImage(named:"unselectedStar")
            
        }else if rate == 2{
            self.ratingImageView1.image = UIImage(named:"starGold")
            self.ratingImageView2.image = UIImage(named:"starGold")
            self.ratingImageView3.image = UIImage(named:"unselectedStar")
            self.ratingImageView4.image = UIImage(named:"unselectedStar")
            self.ratingImageView5.image = UIImage(named:"unselectedStar")
        }else if rate == 1{
            self.ratingImageView1.image = UIImage(named:"starGold")
            self.ratingImageView2.image = UIImage(named:"unselectedStar")
            self.ratingImageView3.image = UIImage(named:"unselectedStar")
            self.ratingImageView4.image = UIImage(named:"unselectedStar")
            self.ratingImageView5.image = UIImage(named:"unselectedStar")
        }
    }
}
