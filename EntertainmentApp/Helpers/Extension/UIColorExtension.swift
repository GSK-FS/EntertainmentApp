//
//  UIColorExtension.swift
//  EntertainmentApp
//
//  Created by GSK on 3/10/22.
//

import Foundation
import UIKit

extension UIColor {
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: a/1.0)
    }
    convenience init(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat, _ a: CGFloat) {
        self.init(red: r, green: g, blue: b, alpha: a/1.0)
    }
    
    @nonobjc class var concrete: UIColor {
        let color = UIColor(r: 240, g: 240, b: 240, a: 1)
        return color
    }
    @nonobjc class var greyAlpha: UIColor {
        let color = UIColor(r: 0, g: 0, b: 0, a: 0.75)
        return color
    }
    @nonobjc class var greySilent: UIColor {
        let color = UIColor(r: 144, g: 140, b: 140, a: 1)
        return color
    }
    @nonobjc class var redButton: UIColor {
        let color = UIColor(r: 223, g: 13, b: 20, a: 1)
        return color
    }
    
    @nonobjc class var softPink: UIColor {
        let color = UIColor(r: 231, g: 93, b: 93, a: 1)
        return color
    }
}
