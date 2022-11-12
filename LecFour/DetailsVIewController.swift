//
//  DetailsVIewController.swift
//  LecFour
//
//  Created by Thathsarani Nayanathara on 2022-10-29.
//

import UIKit
import SnapKit

class DetailsVIewController: UIViewController {
    
    let view1 : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
      
        view.backgroundColor = .blue
        view.addSubview(view1)
        setupConstraint()
    }
    
    func setupConstraint() {
        view1.snp.makeConstraints { make in
            make.leading.equalTo(view.snp_leadingMargin).offset(20)
            make.trailing.equalTo(view.snp_trailingMargin).offset(-20)
            make.top.equalTo(view.snp_topMargin).offset(20)
            make.bottom.equalTo(view.snp_bottomMargin).offset(-20)
            
        }
    }
    

}
