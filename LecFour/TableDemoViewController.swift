//
//  TableDemoViewController.swift
//  LecFour
//
//  Created by Thathsarani Nayanathara on 2022-10-22.
//

import UIKit
import Kingfisher

class TableDemoViewController: UIViewController {
    let data = ["Apple", "Google", "Facebook", "HP", "Dell", "Amazon", "Ebay", "Instagram", "Twitter", "Yahoo"]
    var movies : [Result] = [Result]()
    
    let tableVIew : UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        tableVIew.delegate = self
        tableVIew.dataSource = self
        tableVIew.register(MyCellView.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableVIew)
        
        setupConstraint()
        downloadMoviees()
        
    }
    
    func setupConstraint() {
        tableVIew.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableVIew.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableVIew.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableVIew.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func downloadMoviees() {
        let url = URL(string: "https://api.themoviedb.org/4/list/3?page=1&api_key=f9923821f549f034afb399cd27e37afd")!
        let dataTask = URLSession.shared.dataTask(with: URLRequest(url: url)) {data, res, error in
            
//            print("response \(res)")
            
            if let movieData = data{
                let json = try? JSONDecoder().decode(MoviesModel.self, from: movieData)
                
                if let movies = json?.results {
                    self.movies = movies
                
                }
                DispatchQueue.main.async {
                    self.tableVIew.reloadData()
                }
            }
        }
        dataTask.resume()
    }

}

extension TableDemoViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = UITableViewCell(style: .subtitle , reuseIdentifier: "cell")
        let cell : MyCellView = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        as! MyCellView
//        cell.myImage.image = UIImage(systemName: "highlighter")
//        cell.titleLabel.text = data[indexPath.row]
//        cell.descriptionLabel.text = "Apple"
        
        cell.titleLabel.text = movies[indexPath.row].originalTitle
        
        let imageURL = "https://image.tmdb.org/t/p/w185" + movies[indexPath.row].backdropPath
        if let url = URL(string: imageURL) {
            cell.myImage.kf.setImage(with: url)
        }
        
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexpath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      let vc = MovieDetailViewController()
        vc.selectedMovie = movies[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

class MyCellView : UITableViewCell {
    
    let myImage : UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    let titleLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18 , weight: .bold)
        label.textAlignment = .center
//        label.backgroundColor = .white
        return label
    }()
    
    let descriptionLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12 , weight: .light)
        label.textAlignment = .center
        label.textColor = .blue
//        label.backgroundColor = .white
        return label
    }()
    let baseView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
//        view.layer.shadowRadius = 0.5
        view.layer.shadowOffset = CGSize(width: 10, height: 10)
        view.layer.shadowColor = UIColor.black.cgColor
//        view.layer.shadowOpacity = 0.5
        return view
    }()
    let labelHolder : UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 0
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    let contentHolder : UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    override init(style : UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(myImage)
        layComponent()
        setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implmented ")
    }
    func layComponent(){
        labelHolder.addArrangedSubview(titleLabel)
        labelHolder.addArrangedSubview(descriptionLabel)
        contentHolder.addArrangedSubview(myImage)
        contentHolder.addArrangedSubview(labelHolder)
        baseView.addSubview(contentHolder)
        contentView.addSubview(baseView)
    }
    private func setupConstraint(){
        baseView.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().offset(20)
            make.trailing.bottom.equalToSuperview().offset(-20)
        }
        myImage.snp.makeConstraints{ make in
            make.height.equalTo(80)
            make.width.equalTo(80)
            
        }
    }
    
}
