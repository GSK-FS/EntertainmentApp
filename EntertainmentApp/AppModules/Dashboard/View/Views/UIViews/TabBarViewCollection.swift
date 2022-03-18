//
//  TabBarViewCollection.swift
//  EntertainmentApp
//
//  Created by GSK on 3/15/22.
//

import UIKit

class TabBarViewCollection: UIView {
    
    var titleButton = ["All", "Top Hits", "New Songs", "90 Hits"]
    var colorArray: [UIColor] =  [.greySilent, .greySilent, .greySilent, .greySilent]
    var buttonArray: [Bool] =  [false, false, false, false]
    var currentIndex: IndexPath = [0]
    
    var horizontalCollectionView: UICollectionView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        viewsConfiguration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func viewsConfiguration() {
        let cvLayout = UICollectionViewFlowLayout()
        cvLayout.scrollDirection = .horizontal
        horizontalCollectionView = UICollectionView(frame: .zero, collectionViewLayout: cvLayout)
        horizontalCollectionView.translatesAutoresizingMaskIntoConstraints = false
        horizontalCollectionView.showsHorizontalScrollIndicator = false
        horizontalCollectionView.backgroundColor = .white
        
        horizontalCollectionView.register(TabBarCollectionViewCell.self, forCellWithReuseIdentifier: TabBarCollectionViewCell.identifier)
        horizontalCollectionView.dataSource = self
        horizontalCollectionView.delegate = self
        
        viewsContraints()
    }
    func viewsContraints() {
        self.addSubview(horizontalCollectionView)
        NSLayoutConstraint.activate([
            horizontalCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            horizontalCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            horizontalCollectionView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            horizontalCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
        ])
    }
}



//MARK: - Collection View DataSource
extension TabBarViewCollection: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let numberOFItems = 4
        return numberOFItems
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TabBarCollectionViewCell.identifier, for: indexPath) as! TabBarCollectionViewCell
        cell.buttonTab.setTitle(titleButton[indexPath.item], for: .normal)
        cell.buttonTab.titleLabel?.font = .aspiraMedium(size: 20)
        if indexPath == currentIndex {
            cell.buttonTab.bottomLine.backgroundColor = .softPink
            cell.buttonTab.setTitleColor(.softPink, for: .normal)
        } else {
            cell.buttonTab.bottomLine.backgroundColor = .clear
            cell.buttonTab.setTitleColor(self.colorArray[indexPath.item], for: .normal)
        }
        
        
        if #available(iOS 14.0, *) {
            cell.buttonTab.addAction(UIAction(handler: { action in
                self.currentIndex = indexPath
                self.horizontalCollectionView.reloadData()
            }), for: .touchUpInside)
        } else {
            // Fallback on earlier versions
            print(" ")
        }
        cell.backgroundColor = .white
        return cell
    }
    
    
    ///Custom Size Protocol "Getting the Size of Items"
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellSize = CGSize(width: 110.wRatio, height: 59.wRatio)
        return cellSize
    }
    
    ///Custom Spacing Protocol "Getting the Section Spacing"
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let sectionInset = UIEdgeInsets(top: 0.wRatio, left: 0.wRatio, bottom: 0.wRatio, right: 20.wRatio)
        return sectionInset
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        let cellRowSpace = CGFloat(0.wRatio)
        return cellRowSpace
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        let cellColumnSpace = CGFloat(0)
        return cellColumnSpace
    }
}
