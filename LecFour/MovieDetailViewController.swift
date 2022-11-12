//
//  MovieDetailViewController.swift
//  LecFour
//
//  Created by Thathsarani Nayanathara on 2022-11-12.
//

import UIKit
import SnapKit

class MovieDetailViewController: UIViewController {
    
    var selectedMovie : Result?
    
    let myImage : UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    let titleLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18 , weight: .bold)
        label.textAlignment = .left
//        label.backgroundColor = .white
        return label
    }()
    
    let overviewLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14 , weight: .light)
        label.textAlignment = .left
        label.textColor = .black
//        label.backgroundColor = .white
        return label
    }()

    let relleaseDateLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14 , weight: .light)
        label.textAlignment = .left
        label.textColor = .black
//        label.backgroundColor = .white
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setupConstraint()
        loadContent()

        
    }
    
    func setupConstraint() {
        self.view.addSubview(myImage)
        myImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.height.equalTo(400)
            make.leading.trailing.equalToSuperview()
        }
        let holder = UIStackView(arrangedSubviews: [titleLabel, relleaseDateLabel, overviewLabel])
        holder.spacing = 10
        holder.axis = .vertical
        self.view.addSubview(holder)
        
        holder.snp.makeConstraints { make in
            make.top.equalTo(myImage.snp_bottomMargin).offset(40)
            make.leading.equalTo(view.snp_leadingMargin).offset(20)
            make.trailing.equalTo(view.snp_trailingMargin).offset(-20)
            
        }
    }
    
    func loadContent() {
        if let movie = selectedMovie {
            let imageLink = "https://image.tmdb.org/t/p/w185" + movie.backdropPath
            if let imageURL = URL(string: imageLink){
                myImage.kf.setImage(with: imageURL)
            }
            
            titleLabel.text = movie.title
            relleaseDateLabel.text = movie.releaseDate
            overviewLabel.text = movie.overview
        }
    }

}
