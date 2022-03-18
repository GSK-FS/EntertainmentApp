//
//  HeaderCollectionViewSuplimentry.swift
//  EntertainmentApp
//
//  Created by GSK on 3/14/22.
//

import UIKit

class HeaderCollectionViewSuplimentry: UICollectionReusableView {
    
    static let identiffier = "CellHeader"
    
    let labelTitle = LabelCustom(text: " ", font: .aspiraRegular(size: 14), color: .black, alignment: .left, numberOfLines: 1)
    
    func viewsConfiguration() {
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.isHidden = false
        viewsContraints()
    }
    
    func viewsContraints() {
        self.addSubview(labelTitle)
        NSLayoutConstraint.activate([
            
            labelTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20.wRatio),
            labelTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20.wRatio),
            labelTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            labelTitle.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0)
        ])
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        viewsConfiguration()
    }
    
}
