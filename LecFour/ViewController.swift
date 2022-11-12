//
//  ViewController.swift
//  LecFour
//
//  Created by Thathsarani Nayanathara on 2022-10-22.
//

import UIKit

class ViewController: UIViewController {
//    let view1 : UIView = {
//    let view = UIView()
//    view.translatesAutoresizingMaskIntoConstraints = false
//    view.backgroundColor = .green
//    return view
//}()
    
    let logoImage : UIImageView = {
        let image = UIImageView(image: UIImage(named: "logo"))
        image.translatesAutoresizingMaskIntoConstraints = false
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
        label.font = .systemFont(ofSize: 12 , weight: .bold)
        label.textAlignment = .center
        label.textColor = .blue
//        label.backgroundColor = .white
        return label
    }()
    
    let dateLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12 , weight: .bold)
        label.textAlignment = .center
        label.textColor = .blue
//        label.backgroundColor = .white
        return label
    }()
    
    let viewholder : UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 0
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let viewholderMain : UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .white
        
//        self.view.addSubview(view1)
//        self.view.addSubview(logoImage)
//        self.view.addSubview(titleLabel)
//        self.view.addSubview(descriptionLabel)
//        self.view.addSubview(dateLabel)
        titleLabel.text = "IOS Development"
        descriptionLabel.text = "Apple"
        dateLabel.text = "2022-10-22"
        
        
        viewholder.insertArrangedSubview(titleLabel, at: 0)
        viewholder.insertArrangedSubview(descriptionLabel, at: 1)
        viewholder.insertArrangedSubview(dateLabel, at: 2)
        viewholderMain.insertArrangedSubview(logoImage, at: 0)
        viewholderMain.insertArrangedSubview(viewholder, at: 1)
        view.addSubview(viewholderMain)
        
        
        
        
        setupConstraint()
        
    }
 
    func setupConstraint(){
//        view1.widthAnchor.constraint(equalToConstant: 200).isActive = true
//        view1.heightAnchor.constraint(equalToConstant: 100).isActive = true
//        view1.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        view1.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
//        logoImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 120).isActive = true
//        logoImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
//        logoImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
//        logoImage.heightAnchor.constraint(equalToConstant: 200).isActive = true
//
//        titleLabel.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 100).isActive = true
//        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
//        titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
//        titleLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
//
        logoImage.heightAnchor.constraint(equalToConstant: 60).isActive = true
        logoImage.widthAnchor.constraint(equalToConstant: 60).isActive = true
     
        viewholderMain.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200).isActive = true
        viewholderMain.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        viewholderMain.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
    }

}

