//
//  ViewController.swift
//  EntertainmentApp
//
//  Created by GSK on 3/9/22.
//

import UIKit

class ViewController: BaseViewController {

    let viewModel = ViewModelDashboard()
    
    var buttonTab = TabBarViewCollection()
    var titleLabel: UILabel!
    var pagingViewSlider = SliderPageView()
    var collectionViewLists: UICollectionView!
    
    override func loadView() {
        super.loadView()
        viewModel.fetchData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        // Do any additional setup after loading the view.
        
        configureViews()
    }
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.tintColor = .softPink
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func configureViews() {
        buttonTab.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel = LabelCustom(text: "App Name", font: .aspiraBold(size: 20), color: .white, alignment: .center, numberOfLines: 1)
        
        pagingViewSlider.translatesAutoresizingMaskIntoConstraints = false
        
        let cvLayout = UICollectionViewFlowLayout()
        cvLayout.scrollDirection = .vertical
        collectionViewLists = UICollectionView(frame: .zero, collectionViewLayout: cvLayout)
        collectionViewLists.translatesAutoresizingMaskIntoConstraints = false
        collectionViewLists.showsVerticalScrollIndicator = false
        collectionViewLists.backgroundColor = .white
        
        collectionViewLists.register(A_ScrollingCollectionViewCell.self, forCellWithReuseIdentifier: A_ScrollingCollectionViewCell.identifier)
        collectionViewLists.register(A_StyleScrollingCollectionCell.self, forCellWithReuseIdentifier: A_StyleScrollingCollectionCell.identifier)
        collectionViewLists.register(B_ScrollingCollectionCell.self, forCellWithReuseIdentifier: B_ScrollingCollectionCell.identifier)
        collectionViewLists.register(C_StyleCollectionViewCell.self, forCellWithReuseIdentifier: C_StyleCollectionViewCell.identifier)
        collectionViewLists.register(HeaderCollectionViewSuplimentry.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionViewSuplimentry.identiffier)
        
        collectionViewLists.dataSource = viewModel
        collectionViewLists.delegate = viewModel
        
        setupConstraints()
    }
    func setupConstraints() {
        viewMenuContaier.addSubview(buttonTab)
        viewNavigationContaier.addSubview(titleLabel)
        viewContentContaier.addSubview(pagingViewSlider)
        viewContentContaier.addSubview(collectionViewLists)
        NSLayoutConstraint.activate([
            buttonTab.leadingAnchor.constraint(equalTo: viewMenuContaier.leadingAnchor, constant: 0),
            buttonTab.trailingAnchor.constraint(equalTo: viewMenuContaier.trailingAnchor, constant: 0),
            buttonTab.topAnchor.constraint(equalTo: viewMenuContaier.topAnchor, constant: 0),
            buttonTab.bottomAnchor.constraint(equalTo: viewMenuContaier.bottomAnchor, constant: 0),
            
            titleLabel.leadingAnchor.constraint(equalTo: viewNavigationContaier.leadingAnchor, constant: 70.wRatio),
            titleLabel.trailingAnchor.constraint(equalTo: viewNavigationContaier.trailingAnchor, constant: -70.wRatio),
            titleLabel.bottomAnchor.constraint(equalTo: viewNavigationContaier.bottomAnchor, constant: -15.wRatio),
            
            pagingViewSlider.leadingAnchor.constraint(equalTo: viewContentContaier.leadingAnchor, constant: 0),
            pagingViewSlider.trailingAnchor.constraint(equalTo: viewContentContaier.trailingAnchor, constant: 0),
            pagingViewSlider.topAnchor.constraint(equalTo: viewContentContaier.topAnchor, constant: 0),
            pagingViewSlider.bottomAnchor.constraint(equalTo: pagingViewSlider.topAnchor, constant: 200.wRatio),
            
            collectionViewLists.leadingAnchor.constraint(equalTo: viewContentContaier.leadingAnchor, constant: 0),
            collectionViewLists.trailingAnchor.constraint(equalTo: viewContentContaier.trailingAnchor, constant: 0),
            collectionViewLists.topAnchor.constraint(equalTo: pagingViewSlider.bottomAnchor, constant: 0),
            collectionViewLists.bottomAnchor.constraint(equalTo: viewContentContaier.bottomAnchor, constant: 0),
        ])
    }
    
}

