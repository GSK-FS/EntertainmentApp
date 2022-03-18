//
//  IntExtension.swift
//  EntertainmentApp
//
//  Created by GSK on 3/12/22.
//

import Foundation
import UIKit

//MARK: - Int
extension Int{
    var wScreenAdd: CGFloat {
        let widthDiffrence = UIScreen.main.bounds.width //375 width(–—) of iPhone 8
        return CGFloat(self)+widthDiffrence
    }
    var hScreenAdd: CGFloat {
        let widthDiffrence = UIScreen.main.bounds.height //667 height(|) of iPhone 8
        return CGFloat(self)+widthDiffrence
    }
    
    var wRatio: CGFloat {
        let widthDiffrence = UIScreen.main.bounds.width/375 //375 width(–—) of iPhone 8
        return CGFloat(self)*widthDiffrence
    }
    var hRatio: CGFloat {
        let heightDiffrence = UIScreen.main.bounds.height/667 //667 height(|) of iPhone 8
        return CGFloat(self)*heightDiffrence
    }
    var autoSized: CGFloat {
        let screenWidth = UIScreen.main.bounds.size.width
        let screenHeight = UIScreen.main.bounds.size.height
        let diagonalSize = sqrt((screenWidth * screenWidth) + (screenHeight * screenHeight))
        let percentage = CGFloat(self)/775.19*100 //775.19 is the Diagonal(⁄) size of iPhone xs max
        return diagonalSize * percentage / 100
    }
}

//MARK: - Int
extension Double{
    var wRatio: CGFloat {
        let widthDiffrence = UIScreen.main.bounds.width/375 //375 width(–—) of iPhone 8
        return CGFloat(self)*widthDiffrence
    }
    var hRatio: CGFloat {
        let heightDiffrence = UIScreen.main.bounds.height/667 //667 height(|) of iPhone 8
        return CGFloat(self)*heightDiffrence
    }
    var autoSized: CGFloat {
        let screenWidth = UIScreen.main.bounds.size.width
        let screenHeight = UIScreen.main.bounds.size.height
        let diagonalSize = sqrt((screenWidth * screenWidth) + (screenHeight * screenHeight))
        let percentage = CGFloat(self)/775.19*100 //775.19 is the Diagonal(⁄) size of iPhone 8
        return diagonalSize * percentage / 100
    }
}
