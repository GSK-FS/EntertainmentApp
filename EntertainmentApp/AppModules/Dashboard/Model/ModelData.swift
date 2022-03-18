//
//  ModelData.swift
//  EntertainmentApp
//
//  Created by GSK on 3/15/22.
//

import Foundation

struct ModelData : Codable {
    var movies : [MoviesGroups]?
    
    enum CodingKeys: String, CodingKey {
        case movies = "Movies"
    }

    init(from decoder: Decoder) throws {
        var values = try decoder.container(keyedBy: CodingKeys.self)
        movies = try values.decodeIfPresent([MoviesGroups].self, forKey: .movies)
    }
    
}
///Movies Groups
struct MoviesGroups : Codable {
    var trending : [MovieInfo]?
    var previews : [MovieInfo]?
    var today_Trending : [MovieInfo]?
    var podcast : [MovieInfo]?
    var for_You : [MovieInfo]?
    var listen_Again : [MovieInfo]?
    var action_Movies : [MovieInfo]?
    
    enum CodingKeys: String, CodingKey {
        case trending = "Trending"
        case previews = "Previews"
        case today_Trending = "Today_Trending"
        case podcast = "Podcast"
        case for_You = "For_You"
        case listen_Again = "Listen_Again"
        case action_Movies = "Action_Movies"
    }

    init(from decoder: Decoder) throws {
        var values = try decoder.container(keyedBy: CodingKeys.self)
        trending = try values.decodeIfPresent([MovieInfo].self, forKey: .trending)
        previews = try values.decodeIfPresent([MovieInfo].self, forKey: .previews)
        today_Trending = try values.decodeIfPresent([MovieInfo].self, forKey: .today_Trending)
        podcast = try values.decodeIfPresent([MovieInfo].self, forKey: .podcast)
        for_You = try values.decodeIfPresent([MovieInfo].self, forKey: .for_You)
        listen_Again = try values.decodeIfPresent([MovieInfo].self, forKey: .listen_Again)
        action_Movies = try values.decodeIfPresent([MovieInfo].self, forKey: .action_Movies)
    }
    
}



///Model Data
struct MovieInfo : Codable {
    var image : String?
    var name : String?
    var viewsNumber : String?

    enum CodingKeys: String, CodingKey {
        case image = "image"
        case name = "name"
        case viewsNumber = "viewsNumber"
    }

    init(from decoder: Decoder) throws {
        var values = try decoder.container(keyedBy: CodingKeys.self)
        image = try values.decodeIfPresent(String.self, forKey: .image)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        viewsNumber = try values.decodeIfPresent(String.self, forKey: .viewsNumber)
    }
}
