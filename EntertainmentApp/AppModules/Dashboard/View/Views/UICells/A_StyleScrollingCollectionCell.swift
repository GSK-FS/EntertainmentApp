//
//  C_ScrollingCollectionCell.swift
//  EntertainmentApp
//
//  Created by GSK on 3/18/22.
//

import UIKit

class A_StyleScrollingCollectionCell: BaseCollectionViewCell {
    
    let cellReuseIdentifier = "sCell"
    var layerCornerR: CGFloat = 0
    
    let viewModelDashboard = ViewModelDashboard()
    let controller = UIViewController()
    
    var movieInfo = [MovieInfo]()
    let images = ["image_movie_xmen", "image_movie_theHill", "image_movie_1917", "image_movie_noTimeToDie"]
    var sizeOfCell = CGSize(width: 100, height: 100)
    var layerCornerRadius: CGFloat = 6
    var sectionNumber: Int = 0
    
    var horizontalCollectionView: UICollectionView!
    let cvLayout = UICollectionViewFlowLayout()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
    
    override func viewsConfiguration() {
        super.viewsConfiguration()
        
        viewContainerMain.backgroundColor = .white
        
        
        cvLayout.scrollDirection = .horizontal
        horizontalCollectionView = UICollectionView(frame: .zero, collectionViewLayout: cvLayout)
        horizontalCollectionView.translatesAutoresizingMaskIntoConstraints = false
        horizontalCollectionView.showsHorizontalScrollIndicator = false
        horizontalCollectionView.backgroundColor = .white
        horizontalCollectionView.register(AA_StyleCCell.self, forCellWithReuseIdentifier: AA_StyleCCell.identifier)
        horizontalCollectionView.dataSource = self
        horizontalCollectionView.delegate = self
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        viewContainerMain.addSubview(horizontalCollectionView)
        NSLayoutConstraint.activate([
            horizontalCollectionView.leadingAnchor.constraint(equalTo: viewContainerMain.leadingAnchor, constant: 0),
            horizontalCollectionView.trailingAnchor.constraint(equalTo: viewContainerMain.trailingAnchor, constant: 0),
            horizontalCollectionView.topAnchor.constraint(equalTo: viewContainerMain.topAnchor, constant: 0),
            horizontalCollectionView.bottomAnchor.constraint(equalTo: viewContainerMain.bottomAnchor, constant: 0),
        ])
    }
}


//MARK: - Collection View DataSource
extension A_StyleScrollingCollectionCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print( "Data", viewModelDashboard.movieTrendInfo.count)
        let numberOFItems = 4//
        return numberOFItems
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AA_StyleCCell.identifier, for: indexPath) as? AA_StyleCCell {
            if sectionNumber == 1 {
                cell.imageView.layer.cornerRadius = layerCornerRadius
                cell.imageView.image = UIImage(named: movieInfo[indexPath.item].image!)
            } else if sectionNumber == 3 {
                cell.imageView.layer.cornerRadius = layerCornerRadius
                cell.imageView.image = UIImage(named: movieInfo[indexPath.item].image!)
            }
            cell.imageView.contentMode = .scaleAspectFill
            
            cell.backgroundColor = .white
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    ///Custom Spacing Protocol "Getting the Section Spacing"
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let sectionInset = UIEdgeInsets(top: 0.wRatio, left: 20.wRatio, bottom: 0.wRatio, right: 20.wRatio)
        return sectionInset
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        let cellRowSpace = CGFloat(20.wRatio)
        return cellRowSpace
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        let cellColumnSpace = CGFloat(20.wRatio)
        return cellColumnSpace
    }
}


