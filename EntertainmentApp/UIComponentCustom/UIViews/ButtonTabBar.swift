//
//  ButtonTabBar.swift
//  EntertainmentApp
//
//  Created by GSK on 3/12/22.
//

import UIKit

class ButtonTabBar: UIButton {

    var labelText = UILabel()
    let bottomLine = UIView()
    
//    override var titleLabel: UILabel {
//        return labelText
//    }
    override func setTitle(_ title: String?, for state: UIControl.State) {
        super.setTitle(title, for: state)
        labelText = LabelCustom(text: title ?? "A", font: .aspiraMedium(size: 20), color: .greySilent, alignment: .center, numberOfLines: 1)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        viewsConfiguration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func viewsConfiguration() {
        
        bottomLine.translatesAutoresizingMaskIntoConstraints = false
        bottomLine.backgroundColor = .clear
        
        viewsContraints()
    }
    func viewsContraints() {
        self.addSubview(bottomLine)
        NSLayoutConstraint.activate([
            bottomLine.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            bottomLine.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            bottomLine.topAnchor.constraint(equalTo: bottomLine.bottomAnchor, constant: -2),
            bottomLine.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
        ])
    }
}
