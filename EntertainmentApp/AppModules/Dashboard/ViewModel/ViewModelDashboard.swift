//
//  ViewModelDashboard.swift
//  EntertainmentApp
//
//  Created by GSK on 3/12/22.
//

import Foundation
import UIKit

class ViewModelDashboard: ViewModel {
    
    let images = ["image_movie_xmen", "image_movie_theHill", "image_movie_1917", "image_movie_noTimeToDie"]
    let headersTitle = ["Trending", "Previews", "Today Trending", "Podcast", "For You", "Listen Again", "Action Movies"]
    let cellDelegate : CellDesignDelegate? = nil
    var movieModel: [ModelData] = []
    var movieG = [MoviesGroups]()
    var movieI = [MovieInfo]()
    var movieTrendInfo = [MovieInfo]()
    var moviePrevInfo = [MovieInfo]()
    var movieTodayInfo = [MovieInfo]()
    var moviePodInfo = [MovieInfo]()
    var movieForUInfo = [MovieInfo]()
    var movieListenInfo = [MovieInfo]()
    var movieActionInfo = [MovieInfo]()
    
    var didSetCornerRadius = Initialize(CGFloat(0))
    var didSetSection: Int = 0
    
    func navigationHandler() {
        
    }

    func fetchData () {
        guard let sourcesURL = Services.baseUrl else {
            return}
            do {
                let jsonData = try Data(contentsOf: sourcesURL)
                let jSonDecoder = JSONDecoder()
                let jsonReceived = try jSonDecoder.decode(ModelData.self, from: jsonData)
                
                print(jsonReceived.movies!)
                self.movieG = jsonReceived.movies!
                
                for moviesList in movieG {
                    if (moviesList.trending != nil) {
                        self.movieTrendInfo = moviesList.trending!
                    } else if (moviesList.previews != nil) {
                        self.moviePrevInfo = moviesList.previews!
                    } else if (moviesList.today_Trending != nil) {
                        self.movieTodayInfo = moviesList.today_Trending!
                    } else if (moviesList.podcast != nil) {
                        self.moviePodInfo = moviesList.podcast!
                    } else if (moviesList.for_You != nil) {
                        self.movieForUInfo = moviesList.for_You!
                    } else if (moviesList.listen_Again != nil) {
                        self.movieListenInfo = moviesList.listen_Again!
                    } else if (moviesList.action_Movies != nil) {
                        self.movieActionInfo = moviesList.action_Movies!
                    }
                }
            }
            catch {
                print(error)
            }
        print(movieTrendInfo.count)
    }
    
    func dataInfo(datainfo: [MovieInfo]) -> (name: [String], image: [String], viewsNumber: [String]){
        var name = [String]()
        var image = [String]()
        var viewsNumber = [String]()
        for infoDta in datainfo {
            name.append(infoDta.name!)
            image.append(infoDta.image!)
            viewsNumber.append(infoDta.viewsNumber!)
        }
        let dataBlocks = (name: name, image: image, viewsNumber: viewsNumber)
        return dataBlocks
    }
}

//MARK: - Collection View DataSource
extension ViewModelDashboard: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    ///Number o items in section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var numberOFItems = 1
        if section == 1 {
            numberOFItems = 1
        } else if section == 2 {
            numberOFItems = 1
        } else if section == 3 {
            numberOFItems = 1
        } else if section == 4 {
            numberOFItems = 1
        } else if section == 5 {
            numberOFItems = 4//service.movieListenInfo.count
        } else if section == 6 {
            numberOFItems = 1
        } else {
            numberOFItems = 1
        }
        return numberOFItems
    }
    //cells deque data
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

            if indexPath.section == 0 {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: A_ScrollingCollectionViewCell.identifier, for: indexPath) as! A_ScrollingCollectionViewCell
                cell.movieInfo = movieTrendInfo
                cell.sectionNumber = 0
                cell.layerCornerRadius = 6
                cell.cvLayout.itemSize = CGSize(width: 130.wRatio, height: 200.wRatio)
                return cell
            } else if indexPath.section == 1 {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: A_StyleScrollingCollectionCell.identifier, for: indexPath) as! A_StyleScrollingCollectionCell
                cell.movieInfo = moviePrevInfo
                cell.sectionNumber = 1
                cell.layerCornerRadius = (150/2).wRatio
                cell.cvLayout.itemSize = CGSize(width: 150.wRatio, height: 150.wRatio)
                return cell
            } else if indexPath.section == 2 {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: A_ScrollingCollectionViewCell.identifier, for: indexPath) as! A_ScrollingCollectionViewCell
                cell.movieInfo = movieTodayInfo
                cell.sectionNumber = 2
                cell.layerCornerRadius = 6
                cell.cvLayout.itemSize = CGSize(width: 100.wRatio, height: 150.wRatio)
                return cell
            } else if indexPath.section == 3 {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: A_StyleScrollingCollectionCell.identifier, for: indexPath) as! A_StyleScrollingCollectionCell
                cell.movieInfo = moviePodInfo
                cell.sectionNumber = 3
                cell.layerCornerRadius = (130/2).wRatio
                cell.cvLayout.itemSize = CGSize(width: 130.wRatio, height: 130.wRatio)
                return cell
            } else if indexPath.section == 4 {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: B_ScrollingCollectionCell.identifier, for: indexPath) as! B_ScrollingCollectionCell
                cell.movieInfo = movieForUInfo
                cell.sectionNumber = 4
                cell.layerCornerRadius = (150/2).wRatio
                cell.cvLayout.itemSize = CGSize(width: 150.wRatio, height: 210.wRatio)
                return cell
            } else if indexPath.section == 5 {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: C_StyleCollectionViewCell.identifier, for: indexPath) as! C_StyleCollectionViewCell
                cell.movieInfo = movieListenInfo
                let arrayData = dataInfo(datainfo: movieListenInfo)
                cell.imageView.image = UIImage(named: "image_movie_xmen")
                cell.labelTitle.text = arrayData.name[indexPath.item]
                return cell
            } else if indexPath.section == 6 {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: A_ScrollingCollectionViewCell.identifier, for: indexPath) as! A_ScrollingCollectionViewCell
                cell.movieInfo = movieActionInfo
                cell.sectionNumber = 6
                print(cell.sectionNumber)
                cell.cvLayout.itemSize = CGSize(width: 100.wRatio, height: 150.wRatio)
                return cell
            }
            
        return UICollectionViewCell()
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        let numberOfSection = 7
        return numberOfSection
    }
    ///Sections
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: 0.wScreenAdd, height: 50.wRatio)
    }
    
    ///Custom Size Protocol "Getting the Size of Items"
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var cellSize = CGSize(width: 0.wScreenAdd, height: 200.wRatio)
//        cellViewModel.sizeOfCell = CGSize(width: 200.wRatio, height: 200.wRatio)
        if indexPath.section == 0 {
            cellSize = CGSize(width: 0.wScreenAdd, height: 200.wRatio)
//            cellViewModel.sizeOfCell = CGSize(width: 130.wRatio, height: 200.wRatio)
        } else if indexPath.section == 1 {
            cellSize = CGSize(width: 0.wScreenAdd, height: 150.wRatio)
//            cellViewModel.sizeOfCell = CGSize(width: 150.wRatio, height: 150.wRatio)
        } else if indexPath.section == 2 {
            cellSize = CGSize(width: 0.wScreenAdd, height: 150.wRatio)
//            cellViewModel.sizeOfCell = CGSize(width: 100.wRatio, height: 150.wRatio)
        } else if indexPath.section == 3 {
            cellSize = CGSize(width: 0.wScreenAdd, height: 130.wRatio)
//            cellViewModel.sizeOfCell = CGSize(width: 130.wRatio, height: 130.wRatio)
        } else if indexPath.section == 4 {
            cellSize = CGSize(width: 0.wScreenAdd, height: 210.wRatio)
//            cellViewModel.sizeOfCell = CGSize(width: 150.wRatio, height: 210.wRatio)
        } else if indexPath.section == 5 {
            cellSize = CGSize(width: 100.wRatio, height: 60.wRatio)
//            cellViewModel.sizeOfCell = CGSize(width: 110.wRatio, height: 60.wRatio)
        } else if indexPath.section == 6 {
            cellSize = CGSize(width: 0.wScreenAdd, height: 150.wRatio)
//            cellViewModel.sizeOfCell = CGSize(width: 100.wRatio, height: 150.wRatio)
        }
        
        return cellSize
    }
    
    ///Custom Spacing Protocol "Getting the Section Spacing"
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        var sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        if section == 5 {
            sectionInset = UIEdgeInsets(top: 0, left: 20.wRatio, bottom: 0, right: 20.wRatio)
        } else if section == 6 {
            sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 50.wRatio, right: 0)
        } else {
            sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        return sectionInset
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        var cellRowSpace = CGFloat(0)
        if section == 5 {
            cellRowSpace = CGFloat(10.wRatio)
        } else {
            cellRowSpace = CGFloat(0)
        }
        return cellRowSpace
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        var cellColumnSpace = CGFloat(0)
        if section == 5 {
            cellColumnSpace = CGFloat(10.wRatio)
        } else {
            cellColumnSpace = CGFloat(0)
        }
        return cellColumnSpace
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionViewSuplimentry.identiffier, for: indexPath) as! HeaderCollectionViewSuplimentry
        header.viewsConfiguration()
        header.labelTitle.text = headersTitle[indexPath.section]
        return header
    }
    
}
