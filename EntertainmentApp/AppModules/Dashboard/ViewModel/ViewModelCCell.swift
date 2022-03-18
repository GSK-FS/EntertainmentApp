//
//  ViewModelCCell.swift
//  EntertainmentApp
//
//  Created by GSK on 3/14/22.
//

import Foundation
import UIKit

class ViewModelCCell: ViewModel {
    
    let viewModelDashboard = ViewModelDashboard()
    
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
    
    let images = ["image_movie_xmen", "image_movie_theHill", "image_movie_1917", "image_movie_noTimeToDie"]
    var sizeOfCell = CGSize(width: 100, height: 100)
    var layerCornerRadius: CGFloat = 6
    var sectionNumber: Int = 0
    
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

