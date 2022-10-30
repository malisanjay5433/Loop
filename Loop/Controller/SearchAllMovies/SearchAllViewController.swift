//
//  SearchAllViewController.swift
//  Loop
//
//  Created by Sanjay Mali on 20/10/22.
//

import UIKit

class SearchAllViewController: UIViewController {
    @IBOutlet weak var tableView:UITableView!
    @IBOutlet weak var searchBoxBackgroundView:UIView!
    @IBOutlet weak var emptyStateView:UIView!
    @IBOutlet weak var backButton:UIView!
    @IBOutlet weak var searchBox:UITextField!
    @IBOutlet weak var ratingCollection: UICollectionView!
    //    var allMovies = [MoviesModel]()
    var movies = [MoviesModel]()
    var isUserSearching:Bool?
    //    let ratings = ["*****","****","***","**","*"]
    var allMovies = ReadLocalFile.init().readJSONFromFile(fileName:"movies", type:[MoviesModel].self) ?? []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.movies =  self.allMovies
        setNeedsStatusBarAppearanceUpdate()
        tableView.register(UINib(nibName: "MoviesCell", bundle: nil), forCellReuseIdentifier: "MoviesCell")
        fetchMovieList()
        searchBoxBackgroundView.backgroundColor = UIColor.loopBackgroundColor
        self.view.backgroundColor = UIColor.loopBackgroundColor
        searchBoxBackgroundView.loopdropshadow(radius:1)
        searchBox.layer.cornerRadius = 12
        searchBox.layer.masksToBounds = true
        let tapGestureRecognizerClose = UITapGestureRecognizer(target: self, action: #selector(tapBack(tapGestureRecognizer:)))
        backButton.isUserInteractionEnabled = true
        backButton.addGestureRecognizer(tapGestureRecognizerClose)
        ratingCollection.register(UINib.init(nibName: "ChipRatingCell", bundle: nil), forCellWithReuseIdentifier: "ChipRatingCell")
        ratingCollection.delegate = self
        ratingCollection.dataSource = self
        searchBox.attributedPlaceholder = NSAttributedString(string: "Search all movies", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white.withAlphaComponent(0.4)])
        searchBox.delegate = self
        emptyStateView.backgroundColor =  UIColor.loopBackgroundColor
        tableView.keyboardDismissMode = .onDrag
        searchBox.delegate = self
    }
    @objc func tapBack(tapGestureRecognizer: UITapGestureRecognizer){
        searchBox.endEditing(true)
//        view.endEditing(true)
        self.navigationController?.popToRootViewController(animated:true)
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {   //delegate method
       textField.resignFirstResponder()
       return true
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MovieDetailsViewController"{
            let vc = segue.destination as! MovieDetailsViewController
            vc.movie = sender as? MoviesModel
        }
    }
    func fetchMovieList(){
        DispatchQueue.main.async {
            self.tableView.delegate = self
            self.tableView.dataSource = self
            self.tableView.reloadData()
        }
    }
}
extension SearchAllViewController:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 142
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movies.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MoviesCell", for: indexPath) as! MoviesCell
        cell.movie =  self.movies[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "MovieDetailsViewController", sender:self.movies[indexPath.row])
    }
}
extension SearchAllViewController:UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChipRatingCell", for: indexPath) as! ChipRatingCell
        cell.ratingsSystem(index: indexPath.row)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:100, height:30)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0{
            searchthroughRatings(ratings: 5)
        }
        else if indexPath.row == 1{
            searchthroughRatings(ratings: 4)
        }else if indexPath.row == 2{
            searchthroughRatings(ratings: 3)
        }else if indexPath.row == 3{
            searchthroughRatings(ratings: 2)
        }
        else if indexPath.row == 4{
            searchthroughRatings(ratings: 1)
        }
    }
    func searchthroughRatings(ratings:Int){
        self.movies = allMovies.filter({ "\(Int(($0.rating?.rounded())!))".contains("\(ratings)")})
        debugPrint("Ratings with Movie : \(self.movies)")
        reloadWithEmptyState()
    }
    func reloadWithEmptyState(){
        self.tableView.reloadData()
        if self.movies.count > 0{
            self.tableView.tableFooterView?.isHidden = true
        }else{
            self.tableView.tableFooterView?.isHidden = false
            self.tableView.tableFooterView = self.emptyStateView
        }
    }
}
struct loopKey{
    static let loopbookMark = "BOOKMARK"
}
class loopCache{
    static let shared = loopCache()
    var defaults = UserDefaults.standard
    var bookMarkArray = [Int]()

    private init(){
        
    }
    func saveBookMark(bookmark : [movieBookMarks]){
        do{
            let encodedData: Data = try PropertyListEncoder().encode(bookmark)
            UserDefaults.standard.set(encodedData, forKey:loopKey.loopbookMark)
            UserDefaults.standard.synchronize()
        }catch{
            debugPrint(error.localizedDescription)
        }
    }
    func fetchBookMark() -> [movieBookMarks]?{
        var moviesModel:[movieBookMarks]
        let data = UserDefaults.standard.value(forKey: loopKey.loopbookMark) as? Data
        do{
            let bookmark = try PropertyListDecoder().decode([movieBookMarks].self, from: data ?? Data())
            moviesModel = bookmark
        }catch{
            debugPrint(error.localizedDescription)
            return nil
        }
        return moviesModel
    }
    func saveMark(bookMarkID:Int){
        self.bookMarkArray.append(bookMarkID)
        self.defaults.set(self.bookMarkArray, forKey: "BOOKMARK")
        let id = fetch()
        debugPrint("id : \(id ?? [0])")
    }
    func fetch() -> [Int]?{
        let book = self.defaults.object(forKey: "BOOKMARK") as? [Int]
        return book
    }
}

struct movieBookMarks:Codable{
    let id:Int?
    let isBookMarked:Bool?
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case isBookMarked = "isBookMarked"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        isBookMarked = try values.decodeIfPresent(Bool.self, forKey: .isBookMarked)
    }
}
