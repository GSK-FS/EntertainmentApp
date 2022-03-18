//
//  BaseCollectionViewCell.swift
//  EntertainmentApp
//
//  Created by GSK on 3/10/22.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell {
    
    let viewContainerMain = UIView()
    let imageView = UIImageView()
    var labelTitle = UILabel()
    var labelDetailInfo = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        viewsConfiguration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    static var identifier: String {
        return String(describing: self)
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.layer.cornerRadius = 6
        viewContainerMain.layer.cornerRadius = 6
    }
    
    func viewsConfiguration() {
        viewContainerMain.translatesAutoresizingMaskIntoConstraints = false
        viewContainerMain.backgroundColor = UIColor.white
        viewContainerMain.clipsToBounds = true
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = UIColor.lightGray
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.isHidden = false
        
        labelTitle = LabelCustom(text: "", font: UIFont.aspiraRegular(size: 14.autoSized), color: .black, alignment: .center, numberOfLines: 0)
        labelTitle.isHidden = false
        
        labelDetailInfo = LabelCustom(text: "", font: UIFont.aspiraRegular(size: 14.autoSized), color: .black, alignment: .center, numberOfLines: 0)
        labelDetailInfo.isHidden = false
        
        viewsContraints()
    }
    func viewsContraints() {
        self.addSubview(viewContainerMain)
        viewContainerMain.addSubview(imageView)
        NSLayoutConstraint.activate([
            viewContainerMain.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            viewContainerMain.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            viewContainerMain.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            viewContainerMain.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
        ])
    }
}
