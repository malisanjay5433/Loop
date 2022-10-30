//
//  FavouritesCollectionCell.swift
//  Loop
//
//  Created by Raghvendra Reddy on 19/10/22.
//

import UIKit

class FavouritesCollectionCell: UITableViewCell {
    
    @IBOutlet weak var favouritesCollection: UICollectionView!
    weak var favouriteSelectionDelegate:FavouriteSelectionProtocol?
    override func awakeFromNib() {
        super.awakeFromNib()
        favouritesCollection.register(UINib(nibName: "FavouritesCell", bundle: nil), forCellWithReuseIdentifier: "FavouritesCell")
        favouritesCollection.isPagingEnabled = true
        favouritesCollection.delegate = self
        favouritesCollection.dataSource = self
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
extension FavouritesCollectionCell:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = favouritesCollection.dequeueReusableCell(withReuseIdentifier: "FavouritesCell", for: indexPath) as! FavouritesCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // MARK: write protocol base on requirment
        favouriteSelectionDelegate?.selectedFavourite(position: indexPath.row)
    }
}

extension FavouritesCollectionCell:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 182, height: 270)
    }
}

protocol FavouriteSelectionProtocol:AnyObject {
    func selectedFavourite(position:Int)->Void
}
