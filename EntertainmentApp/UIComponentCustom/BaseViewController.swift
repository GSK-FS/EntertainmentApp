//
//  BaseViewController.swift
//  EntertainmentApp
//
//  Created by GSK on 3/10/22.
//

import UIKit

class BaseViewController: UIViewController {

    let viewNavigationContaier = UIViewCustom(backgroundColor: .softPink)
    let viewMenuContaier = UIViewCustom(backgroundColor: .white)
    let viewContentContaier = UIViewCustom(backgroundColor: .concrete)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureViewsSuper()
    }
    
    func configureViewsSuper() {
        //Views Customization here
        view.backgroundColor = UIColor.lightGray
        
        setupConstraintsSuper()
    }
    
    func setupConstraintsSuper() {
        view.addSubview(viewNavigationContaier)
        view.addSubview(viewMenuContaier)
        view.addSubview(viewContentContaier)
        NSLayoutConstraint.activate([
            viewNavigationContaier.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            viewNavigationContaier.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            viewNavigationContaier.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            //viewNavigationContaier.bottomAnchor handled for safearea
            
            viewMenuContaier.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            viewMenuContaier.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            viewMenuContaier.topAnchor.constraint(equalTo: viewNavigationContaier.bottomAnchor, constant: 0),
            viewMenuContaier.bottomAnchor.constraint(equalTo: viewMenuContaier.topAnchor, constant: 58.wRatio),
            
            viewContentContaier.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            viewContentContaier.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            viewContentContaier.topAnchor.constraint(equalTo: viewMenuContaier.bottomAnchor, constant: 0),
            viewContentContaier.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
        ])
        
        if #available(iOS 11.0, *) {
            let safearea = view.safeAreaLayoutGuide.layoutFrame
            print("safe Area: \(safearea)")
            if let window = UIApplication.shared.keyWindow {
//                let safeAreaLeft = window.safeAreaInsets.left
//                let safeAreaRight = window.safeAreaInsets.right
//                let safeAreaBottom = window.safeAreaInsets.bottom
                let safeAreaTop = window.safeAreaInsets.top
                print("SafeTop \(safeAreaTop)")
                viewNavigationContaier.bottomAnchor.constraint(equalTo: viewNavigationContaier.topAnchor, constant: (38 + safeAreaTop).wRatio).isActive = true
            }
        } else {
            viewNavigationContaier.bottomAnchor.constraint(equalTo: viewNavigationContaier.topAnchor, constant: (38).wRatio).isActive = true
        }
        
    }

}
