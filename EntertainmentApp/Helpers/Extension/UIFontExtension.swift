//
//  UIFontExtension.swift
//  EntertainmentApp
//
//  Created by GSK on 3/14/22.
//

import Foundation
import UIKit

extension UIFont {
    static func aspiraBold(size: CGFloat) -> UIFont {
        var font = UIFont.systemFont(ofSize: 20)
        font = UIFont(name: "Aspira-Bold", size: size)!
        return font
    }
    static func aspiraDemi(size: CGFloat) -> UIFont {
        var font = UIFont.systemFont(ofSize: 20)
        font = UIFont(name: "Aspira-Demi", size: size)!
        return font
    }
    static func aspiraMedium(size: CGFloat) -> UIFont {
        var font = UIFont.systemFont(ofSize: 20)
        font = UIFont(name: "Aspira-Medium", size: size)!
        return font
    }
    static func aspiraRegular(size: CGFloat) -> UIFont {
        var font = UIFont.systemFont(ofSize: 20)
        font = UIFont(name: "Aspira-Regular", size: size)!
        return font
    }
    static func aspiraLight(size: CGFloat) -> UIFont {
        var font = UIFont.systemFont(ofSize: 20)
        font = UIFont(name: "Aspira-Light", size: size)!
        return font
    }
    static func aspiraThin(size: CGFloat) -> UIFont {
        var font = UIFont.systemFont(ofSize: 20)
        font = UIFont(name: "Aspira-Thin", size: size)!
        return font
    }
}
