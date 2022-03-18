//
//  B_StyleCollectionViewCell.swift
//  EntertainmentApp
//
//  Created by GSK on 3/14/22.
//

import UIKit

class B_StyleCollectionViewCell: BaseCollectionViewCell {
    let cellReuseIdentifier = "bCell"
    
    override func viewsConfiguration() {
        super.viewsConfiguration()
        imageView.isHidden = false
        //CornerRadius will be defined in DataSource
        imageView.layer.cornerRadius = (150/2).wRatio
        
        labelTitle.isHidden = false
        labelDetailInfo.isHidden = false
    }
    override func viewsContraints() {
        super.viewsContraints()
        viewContainerMain.addSubview(imageView)
        viewContainerMain.addSubview(labelTitle)
        viewContainerMain.addSubview(labelDetailInfo)
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: viewContainerMain.leadingAnchor, constant: 0),
            imageView.trailingAnchor.constraint(equalTo: viewContainerMain.trailingAnchor, constant: 0),
            imageView.topAnchor.constraint(equalTo: viewContainerMain.topAnchor, constant: 0),
            imageView.heightAnchor.constraint(equalToConstant: 150.wRatio),
            
            labelTitle.leadingAnchor.constraint(equalTo: viewContainerMain.leadingAnchor, constant: 10.wRatio),
            labelTitle.trailingAnchor.constraint(equalTo: viewContainerMain.trailingAnchor, constant: -10.wRatio),
            labelTitle.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10.wRatio),
            
            labelDetailInfo.leadingAnchor.constraint(equalTo: viewContainerMain.leadingAnchor, constant: 10.wRatio),
            labelDetailInfo.trailingAnchor.constraint(equalTo: viewContainerMain.trailingAnchor, constant: -10.wRatio),
            labelDetailInfo.topAnchor.constraint(equalTo: labelTitle.bottomAnchor, constant: 5.wRatio),
            labelDetailInfo.bottomAnchor.constraint(equalTo: viewContainerMain.bottomAnchor, constant: -2.wRatio),
        ])
    }
}
