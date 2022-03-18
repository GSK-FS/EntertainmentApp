//
//  A_StyleCollectionViewCell.swift
//  EntertainmentApp
//
//  Created by GSK on 3/14/22.
//

import UIKit

class A_StyleCollectionViewCell: BaseCollectionViewCell {
    
    let cellReuseIdentifier = "aCell"
    
    let gradient: CAGradientLayer = CAGradientLayer()
    
    override func viewsConfiguration() {
        super.viewsConfiguration()
        imageView.isHidden = false
        viewContainerMain.layer.cornerRadius = 0
        viewContainerMain.backgroundColor = .white
        //CornerRadius will be defined in DataSource
        
        labelTitle.isHidden = true
        labelDetailInfo.isHidden = true
        
//        gradient.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.frame = CGRect(x: 0.0, y: 0.0, width: 0.wScreenAdd, height: 200.wRatio)
        imageView.layer.insertSublayer(gradient, at: 0)
    }
    override func viewsContraints() {
        super.viewsContraints()
        viewContainerMain.addSubview(imageView)
        NSLayoutConstraint.activate([
            
            imageView.leadingAnchor.constraint(equalTo: viewContainerMain.leadingAnchor, constant: 0),
            imageView.trailingAnchor.constraint(equalTo: viewContainerMain.trailingAnchor, constant: 0),
            imageView.topAnchor.constraint(equalTo: viewContainerMain.topAnchor, constant: 0),
            imageView.bottomAnchor.constraint(equalTo: viewContainerMain.bottomAnchor, constant: 0)
        ])
    }
}
