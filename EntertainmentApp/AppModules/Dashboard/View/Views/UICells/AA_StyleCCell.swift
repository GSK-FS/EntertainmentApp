//
//  A_StyleCCell.swift
//  EntertainmentApp
//
//  Created by GSK on 3/17/22.
//

import UIKit

class AA_StyleCCell: BaseCollectionViewCell {
    
    override func viewsConfiguration() {
        super.viewsConfiguration()
        imageView.isHidden = false
        viewContainerMain.layer.cornerRadius = 6
        viewContainerMain.backgroundColor = .white
        //CornerRadius will be defined in DataSource
        
        labelTitle.isHidden = true
        labelDetailInfo.isHidden = true
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
