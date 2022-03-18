//
//  BaseTableViewCell.swift
//  EntertainmentApp
//
//  Created by GSK on 3/10/22.
//

import UIKit

class BaseTableViewCell: UITableViewCell {

    let viewContainerMain = UIView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        viewsConfiguration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    static var identifier: String {
        return String(describing: self)
    }
    
    func viewsConfiguration() {
        viewContainerMain.translatesAutoresizingMaskIntoConstraints = false
        viewContainerMain.backgroundColor = UIColor.white
        viewContainerMain.clipsToBounds = true
        
        viewsContraints()
    }
    func viewsContraints() {
        self.contentView.addSubview(viewContainerMain)
        
        NSLayoutConstraint.activate([
            viewContainerMain.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            viewContainerMain.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            viewContainerMain.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            viewContainerMain.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
        ])
    }

}
