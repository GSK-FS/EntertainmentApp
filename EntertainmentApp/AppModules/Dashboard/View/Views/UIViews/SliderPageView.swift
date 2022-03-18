//
//  SliderPageView.swift
//  EntertainmentApp
//
//  Created by GSK on 3/15/22.
//

import UIKit

class SliderPageView: UIView {
    var sliderImages = ["image_movie_tandav", "image_movie_tandav", "image_movie_tandav", "image_movie_tandav"]
    
    
    var horizontalCollectionView: UICollectionView!
    var buttonPlay = UIButton(type: .system)
    var pagingIndicator = UIPageControl()
    let gradient: CAGradientLayer = CAGradientLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        viewsConfiguration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func viewsConfiguration() {
        buttonPlay.translatesAutoresizingMaskIntoConstraints = false
        
        buttonPlay.titleLabel?.font = .aspiraDemi(size: 18)
        buttonPlay.setTitle("  Play", for: .normal)
        buttonPlay.clipsToBounds = true
        buttonPlay.setImage(UIImage(named: "icon_play")?.withRenderingMode(.alwaysTemplate), for: .normal)
        buttonPlay.tintColor = UIColor.white
        buttonPlay.backgroundColor = .redButton
        buttonPlay.semanticContentAttribute = .forceLeftToRight
        buttonPlay.layer.cornerRadius = 5
        
        pagingIndicator.translatesAutoresizingMaskIntoConstraints = false
        pagingIndicator.pageIndicatorTintColor = .greySilent
        pagingIndicator.currentPageIndicatorTintColor = .redButton
        pagingIndicator.currentPage = 0
        pagingIndicator.numberOfPages = sliderImages.count
        
        
        let cvLayout = UICollectionViewFlowLayout()
        cvLayout.scrollDirection = .horizontal
        horizontalCollectionView = UICollectionView(frame: .zero, collectionViewLayout: cvLayout)
        horizontalCollectionView.translatesAutoresizingMaskIntoConstraints = false
        horizontalCollectionView.showsHorizontalScrollIndicator = false
        horizontalCollectionView.backgroundColor = .white
        horizontalCollectionView.isPagingEnabled = true
        
        horizontalCollectionView.register(A_StyleCollectionViewCell.self, forCellWithReuseIdentifier: A_StyleCollectionViewCell.identifier)
        horizontalCollectionView.dataSource = self
        horizontalCollectionView.delegate = self
        
        
        gradient.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.frame = CGRect(x: 0.0, y: 0.0, width: 0.wScreenAdd, height: 200.wRatio)
        
        viewsContraints()
    }
    func viewsContraints() {
        self.addSubview(horizontalCollectionView)
        self.addSubview(pagingIndicator)
        self.addSubview(buttonPlay)
        NSLayoutConstraint.activate([
            horizontalCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            horizontalCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            horizontalCollectionView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            horizontalCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            
            pagingIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0),
            pagingIndicator.widthAnchor.constraint(equalToConstant: 200.wRatio),
            pagingIndicator.heightAnchor.constraint(equalToConstant: 20.wRatio),
            pagingIndicator.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10.wRatio),
            
            buttonPlay.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0),
            buttonPlay.widthAnchor.constraint(equalToConstant: 100.wRatio),
            buttonPlay.heightAnchor.constraint(equalToConstant: 40.wRatio),
            buttonPlay.bottomAnchor.constraint(equalTo: pagingIndicator.topAnchor, constant: -10.wRatio),
        ])
    }
}



//MARK: - Collection View DataSource
extension SliderPageView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let numberOFItems = 4
        return numberOFItems
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: A_StyleCollectionViewCell.identifier, for: indexPath) as! A_StyleCollectionViewCell
        cell.imageView.image = UIImage(named: sliderImages[indexPath.item])
        cell.gradient.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        cell.viewContainerMain.layer.cornerRadius = 0
        cell.backgroundColor = .white
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        pagingIndicator.currentPage = indexPath.item
    }
    
    ///Custom Size Protocol "Getting the Size of Items"
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellSize = CGSize(width: 0.wScreenAdd, height: 200.wRatio)
        return cellSize
    }
    
    ///Custom Spacing Protocol "Getting the Section Spacing"
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let sectionInset = UIEdgeInsets(top: 0.wRatio, left: 0.wRatio, bottom: 0.wRatio, right: 0.wRatio)
        return sectionInset
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        let cellRowSpace = CGFloat(0)
        return cellRowSpace
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        let cellColumnSpace = CGFloat(0)
        return cellColumnSpace
    }
}


