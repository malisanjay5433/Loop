//
//  ChipRatingCell.swift
//  Loop
//
//  Created by Sanjay Mali on 20/10/22.
//

import UIKit

class ChipRatingCell: UICollectionViewCell {
    
    @IBOutlet weak var ratingImageView1: UIImageView!
    @IBOutlet weak var ratingImageView2: UIImageView!
    @IBOutlet weak var ratingImageView3: UIImageView!
    @IBOutlet weak var ratingImageView4: UIImageView!
    @IBOutlet weak var ratingImageView5: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.clear
        self.layer.cornerRadius = 15
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 1
    }
    
    
    func ratingsSystem(index: Int){
        switch index{
        case 0:
             self.ratingImageView1.image = UIImage(named:"starwhite")
             self.ratingImageView2.image = UIImage(named:"starwhite")
             self.ratingImageView3.image = UIImage(named:"starwhite")
             self.ratingImageView4.image = UIImage(named:"starwhite")
             self.ratingImageView5.image = UIImage(named:"starwhite")
             break
        case 1:
            self.ratingImageView1.image = UIImage(named:"starwhite")
            self.ratingImageView2.image = UIImage(named:"starwhite")
            self.ratingImageView3.image = UIImage(named:"starwhite")
            self.ratingImageView4.image = UIImage(named:"starwhite")
            self.ratingImageView5.image = UIImage(named:"unselectedStar")
             break
        case 2:
            self.ratingImageView1.image = UIImage(named:"starwhite")
            self.ratingImageView2.image = UIImage(named:"starwhite")
            self.ratingImageView3.image = UIImage(named:"starwhite")
            self.ratingImageView4.image = UIImage(named:"unselectedStar")
            self.ratingImageView5.image = UIImage(named:"unselectedStar")

             break
        case 3:
            self.ratingImageView1.image = UIImage(named:"starwhite")
            self.ratingImageView2.image = UIImage(named:"starwhite")
            self.ratingImageView3.image = UIImage(named:"unselectedStar")
            self.ratingImageView4.image = UIImage(named:"unselectedStar")
            self.ratingImageView5.image = UIImage(named:"unselectedStar")

            break
        case 4:
            self.ratingImageView1.image = UIImage(named:"starwhite")
            self.ratingImageView2.image = UIImage(named:"unselectedStar")
            self.ratingImageView3.image = UIImage(named:"unselectedStar")
            self.ratingImageView4.image = UIImage(named:"unselectedStar")
            self.ratingImageView5.image = UIImage(named:"unselectedStar")
            break
        default: break
        
        }
    }
    func ratingsSystemGold(index: Int){
        switch index{
        case 0:
             self.ratingImageView1.image = UIImage(named:"starGold")
             self.ratingImageView2.image = UIImage(named:"starGold")
             self.ratingImageView3.image = UIImage(named:"starGold")
             self.ratingImageView4.image = UIImage(named:"starGold")
             self.ratingImageView5.image = UIImage(named:"starGold")
             break
        case 1:
            self.ratingImageView1.image = UIImage(named:"starGold")
            self.ratingImageView2.image = UIImage(named:"starGold")
            self.ratingImageView3.image = UIImage(named:"starGold")
            self.ratingImageView4.image = UIImage(named:"starGold")
            self.ratingImageView5.image = UIImage(named:"unselectedStar")
             break
        case 2:
            self.ratingImageView1.image = UIImage(named:"starGold")
            self.ratingImageView2.image = UIImage(named:"starGold")
            self.ratingImageView3.image = UIImage(named:"starGold")
            self.ratingImageView4.image = UIImage(named:"unselectedStar")
            self.ratingImageView5.image = UIImage(named:"unselectedStar")

             break
        case 3:
            self.ratingImageView1.image = UIImage(named:"starGold")
            self.ratingImageView2.image = UIImage(named:"starGold")
            self.ratingImageView3.image = UIImage(named:"unselectedStar")
            self.ratingImageView4.image = UIImage(named:"unselectedStar")
            self.ratingImageView5.image = UIImage(named:"unselectedStar")

            break
        case 4:
            self.ratingImageView1.image = UIImage(named:"starGold")
            self.ratingImageView2.image = UIImage(named:"unselectedStar")
            self.ratingImageView3.image = UIImage(named:"unselectedStar")
            self.ratingImageView4.image = UIImage(named:"unselectedStar")
            self.ratingImageView5.image = UIImage(named:"unselectedStar")
            break
        default: break
        
        }
    }
}
