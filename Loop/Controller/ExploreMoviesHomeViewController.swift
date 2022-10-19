//
//  ViewController.swift
//  Loop
//
//  Created by Sanjay Mali on 18/10/22.
//

import UIKit
class ExploreMoviesHomeViewController: UIViewController{
    var Headerview : UIView!
    var NewHeaderLayer : CAShapeLayer!
    private let headerHeight : CGFloat = 320
    private let headerCut : CGFloat = 50
    @IBOutlet weak var tableView:UITableView!
    let sectioTitle  = ["YOUR FAVORITES","OUR STAFF PICKS"]
    var movies = [MoviesModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.loopBackgroundColor
        tableView.backgroundColor = UIColor.loopBackgroundColor
        tableView.register(UINib(nibName: "MoviesCell", bundle: nil), forCellReuseIdentifier: "MoviesCell")
        fetchMovieList()
        self.navigationController?.isNavigationBarHidden = true
        if #available(iOS 15.0, *) {
            UITableView.appearance().sectionHeaderTopPadding = 0.0
        }
    }
    func fetchMovieList(){
        DispatchQueue.main.async {
            self.movies = ReadLocalFile.init().readJSONFromFile(fileName:"movies", type:[MoviesModel].self) ?? []
            self.tableView.delegate = self
            self.tableView.dataSource = self
            debugPrint("movies List : \(self.movies)")
            self.tableView.reloadData()
            self.UpdateView()
        }
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.tableView.decelerationRate = UIScrollView.DecelerationRate.fast
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.setupnewview()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MovieDetailsViewController"{
            let vc = segue.destination as! MovieDetailsViewController
            vc.movie = self.movies[sender as? Int ?? 0]
        }
    }
}
extension ExploreMoviesHomeViewController:UITableViewDelegate, UITableViewDataSource{
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
        performSegue(withIdentifier: "MovieDetailsViewController", sender:indexPath.row)
    }
}
extension ExploreMoviesHomeViewController{
    func UpdateView() {
        Headerview = tableView.tableHeaderView
        tableView.tableHeaderView = nil
        tableView.rowHeight = UITableView.automaticDimension
        tableView.addSubview(Headerview)
        
        NewHeaderLayer = CAShapeLayer()
        NewHeaderLayer.fillColor = UIColor.loopBackgroundColor.cgColor
        Headerview.layer.mask = NewHeaderLayer
        
        let newheight = headerHeight - headerCut / 2
        tableView.contentInset = UIEdgeInsets(top: newheight, left: 0, bottom: 0, right: 0)
        tableView.contentOffset = CGPoint(x: 0, y: -newheight)
        self.setupnewview()
    }
    func setupnewview() {
        let newheight = headerHeight - headerCut / 2
        var getheaderframe = CGRect(x: 0, y: -newheight, width: tableView.bounds.width, height: headerHeight)
        if tableView.contentOffset.y < newheight{
            getheaderframe.origin.y = tableView.contentOffset.y
            getheaderframe.size.height = -tableView.contentOffset.y + headerCut / 2
        }
        Headerview.frame = getheaderframe
        let cutDirection = UIBezierPath()
        cutDirection.move(to: CGPoint(x: 0, y: 0))
        cutDirection.addLine(to: CGPoint(x: getheaderframe.width, y: 0))
        cutDirection.addLine(to: CGPoint(x: getheaderframe.width, y: getheaderframe.height - headerCut))
        cutDirection.addLine(to: CGPoint(x: 0, y: getheaderframe.height))
        NewHeaderLayer.path = cutDirection.cgPath
    }
}
