//
//  C_StyleCollectionViewCell.swift
//  EntertainmentApp
//
//  Created by GSK on 3/14/22.
//

import UIKit

class C_StyleCollectionViewCell: BaseCollectionViewCell {
    let cellReuseIdentifier = "cCell"
    
    var movieInfo = [MovieInfo]()
    
    override func viewsConfiguration() {
        super.viewsConfiguration()
        imageView.isHidden = false
        imageView.layer.cornerRadius = 6
        //CornerRadius will be defined in DataSource
        
        labelTitle.isHidden = false
        labelDetailInfo.isHidden = true
    }
    override func viewsContraints() {
        super.viewsContraints()
        viewContainerMain.addSubview(imageView)
        viewContainerMain.addSubview(labelTitle)
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: viewContainerMain.leadingAnchor, constant: 0),
            imageView.trailingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 40.wRatio),
            imageView.topAnchor.constraint(equalTo: viewContainerMain.topAnchor, constant: 0),
            imageView.bottomAnchor.constraint(equalTo: viewContainerMain.bottomAnchor, constant: 0),
            
            labelTitle.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 5.wRatio),
            labelTitle.trailingAnchor.constraint(equalTo: viewContainerMain.trailingAnchor, constant: 0),
            labelTitle.centerYAnchor.constraint(equalTo: viewContainerMain.centerYAnchor, constant: 0),
        ])
    }
}
