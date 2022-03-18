//
//  LabelCustom.swift
//  EntertainmentApp
//
//  Created by GSK on 3/13/22.
//

import UIKit

class LabelCustom: UILabel {
    
    required init(text: String, font: UIFont, color: UIColor, alignment: NSTextAlignment, numberOfLines: Int) {
        super.init(frame: .zero)
        super.translatesAutoresizingMaskIntoConstraints = false
        
        customConfiguration(text: text, font: font, color: color, alignment: alignment, numberOfLines: numberOfLines)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func customConfiguration(text: String = "", font: UIFont = UIFont.boldSystemFont(ofSize: 12), color: UIColor = UIColor.black, alignment: NSTextAlignment = .center, numberOfLines: Int = 0)  {
        
        self.textColor = color
        self.text = text
        self.font = UIFont(name: (font.fontName), size: CGFloat(Int(font.pointSize).autoSized))
        self.textAlignment = alignment
        self.numberOfLines = numberOfLines
    }
    
}
