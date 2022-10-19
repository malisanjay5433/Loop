//
//  MovieDetailsViewController.swift
//  Loop
//
//  Created by Sanjay Mali on 19/10/22.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    @IBOutlet weak var bannerImage: ImagePlaceholderLoader!
    var movie:MoviesModel?
    @IBOutlet weak var favView: UIView!
    @IBOutlet weak var closeView: UIView!
    @IBOutlet weak var releseLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var budgetLabel: UILabel!
    @IBOutlet weak var revenueLabel: UILabel!
    @IBOutlet weak var langLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var directorCollection: UICollectionView!
    @IBOutlet weak var actorCollection: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        populateData()
    }
    @objc func dismiss(tapGestureRecognizer: UITapGestureRecognizer){
        self.dismiss(animated:true)
    }
    @objc func fav(tapGestureRecognizer: UITapGestureRecognizer){
        
    }
}
extension MovieDetailsViewController{
    func populateData(){
        bannerImage.loopshadow()
        guard let imgUrl = movie?.posterUrl else {return}
        guard let url = URL(string: imgUrl) else { return}
        self.bannerImage.loadImageWithUrl(url)
        releseLabel.text = movie?.releaseDate ?? "" + " . " + "\(movie?.runtime ?? 0)"
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        guard let date = formatter.date(from: movie?.releaseDate ?? "") else {
            return
        }
        formatter.dateFormat = "yyyy"
        
        let year = formatter.string(from: date)
        formatter.dateFormat = "MM"
        let month = formatter.string(from: date)
        formatter.dateFormat = "dd"
        let day = formatter.string(from: date)
        print(year, month, day) // 2018 12 24
        let boldAttribute = [NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Bold", size: 24.0)!]
        let regularAttribute = [
            NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Light", size: 24.0),
            NSAttributedString.Key.foregroundColor: UIColor.loopVeryMedEmphasis
        ]
        let boldText = NSAttributedString(string:movie?.title ?? "", attributes: boldAttribute)
        let regularText = NSAttributedString(string: "(\(year))", attributes: regularAttribute as [NSAttributedString.Key : Any])
        let newString = NSMutableAttributedString()
        newString.append(boldText)
        newString.append(regularText)
        titleLabel.attributedText = newString
        overviewLabel.text = movie?.overview ?? ""
        overviewLabel.textColor = UIColor.loopVeryMedEmphasis
        
        let usLocale = Locale(identifier: "en-US") // US
        budgetLabel.text = movie?.budget?.currency(for: usLocale) ?? "NA"
        revenueLabel.text = movie?.revenue?.currency(for: usLocale) ?? "NA"
        langLabel.text = movie?.language ?? "NA"
        ratingLabel.text  = "\(movie?.rating ?? 0.0)"
        
        // Do any additional setup after loading the view.
        let tapGestureRecognizerClose = UITapGestureRecognizer(target: self, action: #selector(dismiss(tapGestureRecognizer:)))
        closeView.isUserInteractionEnabled = true
        closeView.addGestureRecognizer(tapGestureRecognizerClose)
        
        let tapGestureRecognizerFav = UITapGestureRecognizer(target: self, action: #selector(fav(tapGestureRecognizer:)))
        favView.isUserInteractionEnabled = true
        favView.addGestureRecognizer(tapGestureRecognizerFav)
        
        directorCollection.dataSource = self
        directorCollection.delegate = self
        
        actorCollection.dataSource = self
        actorCollection.delegate = self
        
        directorCollection.register(UINib.init(nibName: "ActorDirectorCell", bundle: nil), forCellWithReuseIdentifier: "ActorDirectorCell")
        actorCollection.register(UINib.init(nibName: "ActorDirectorCell", bundle: nil), forCellWithReuseIdentifier: "ActorDirectorCell")
    }
}
