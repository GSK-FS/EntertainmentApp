//
//  TabBarCollectionViewCell.swift
//  EntertainmentApp
//
//  Created by GSK on 3/15/22.
//

import UIKit

class TabBarCollectionViewCell: BaseCollectionViewCell {
    let cellReuseIdentifier = "tCell"
    
    var active: Bool = false
    let buttonTab = ButtonTabBar(type: .system)
    
    override func viewsConfiguration() {
        super.viewsConfiguration()
        buttonTab.translatesAutoresizingMaskIntoConstraints = false
        buttonTab.setTitle(" ", for: .normal)
        buttonTab.setTitleColor(.greySilent, for: .normal)

        
        viewContainerMain.backgroundColor = .white
        imageView.isHidden = true
        labelTitle.isHidden = true
        labelDetailInfo.isHidden = true
    }
    override func viewsContraints() {
        super.viewsContraints()
        viewContainerMain.addSubview(buttonTab)
        NSLayoutConstraint.activate([
            buttonTab.leadingAnchor.constraint(equalTo: viewContainerMain.leadingAnchor, constant: 0),
            buttonTab.trailingAnchor.constraint(equalTo: viewContainerMain.trailingAnchor, constant: 0),
            buttonTab.topAnchor.constraint(equalTo: viewContainerMain.topAnchor, constant: 0),
            buttonTab.bottomAnchor.constraint(equalTo: viewContainerMain.bottomAnchor, constant: 0)
        ])
    }
    
    ///Selectors
    @objc func buttonTabAction() {
        active  = !active
        if isSelected {
            buttonTab.setTitleColor(.softPink, for: .normal)
            buttonTab.bottomLine.backgroundColor = .softPink
        } else {
            buttonTab.setTitleColor(.greySilent, for: .normal)
            buttonTab.bottomLine.backgroundColor = .clear
        }
    }
}
