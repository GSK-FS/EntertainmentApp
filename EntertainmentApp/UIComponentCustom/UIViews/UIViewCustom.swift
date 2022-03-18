//
//  UIViewCustom.swift
//  EntertainmentApp
//
//  Created by GSK on 3/13/22.
//

import UIKit

class UIViewCustom: UIView {
    
    required init(backgroundColor: UIColor) {
        super.init(frame: .zero)
        self.customConfiguration(backgroundColor: backgroundColor)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        fatalError("init(coder:) has not been implemented")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func customConfiguration(backgroundColor: UIColor = .black) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = backgroundColor
        self.clipsToBounds = true
    }
    
}
