//
//  StaffPicksModel.swift
//  Loop
//
//  Created by Sanjay Mali on 18/10/22.
//

import Foundation
struct MoviesModel:Codable {
    let rating : Double?
    let id : Int?
    let revenue : Int?
    let releaseDate : String?
    let director : Director?
    let posterUrl : String?
    let cast : [Cast]?
    let runtime : Int?
    let title : String?
    let overview : String?
    let reviews : Int?
    let budget : Int?
    let language : String?
    let genres : [String]?

    enum CodingKeys: String, CodingKey {

        case rating = "rating"
        case id = "id"
        case revenue = "revenue"
        case releaseDate = "releaseDate"
        case director = "director"
        case posterUrl = "posterUrl"
        case cast = "cast"
        case runtime = "runtime"
        case title = "title"
        case overview = "overview"
        case reviews = "reviews"
        case budget = "budget"
        case language = "language"
        case genres = "genres"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        rating = try values.decodeIfPresent(Double.self, forKey: .rating)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        revenue = try values.decodeIfPresent(Int.self, forKey: .revenue)
        releaseDate = try values.decodeIfPresent(String.self, forKey: .releaseDate)
        director = try values.decodeIfPresent(Director.self, forKey: .director)
        posterUrl = try values.decodeIfPresent(String.self, forKey: .posterUrl)
        cast = try values.decodeIfPresent([Cast].self, forKey: .cast)
        runtime = try values.decodeIfPresent(Int.self, forKey: .runtime)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        overview = try values.decodeIfPresent(String.self, forKey: .overview)
        reviews = try values.decodeIfPresent(Int.self, forKey: .reviews)
        budget = try values.decodeIfPresent(Int.self, forKey: .budget)
        language = try values.decodeIfPresent(String.self, forKey: .language)
        genres = try values.decodeIfPresent([String].self, forKey: .genres)
    }

}

struct Director : Codable {
    let name : String?
    let pictureUrl : String?

    enum CodingKeys: String, CodingKey {

        case name = "name"
        case pictureUrl = "pictureUrl"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        pictureUrl = try values.decodeIfPresent(String.self, forKey: .pictureUrl)
    }

}
struct Cast : Codable {
    let name : String?
    let pictureUrl : String?
    let character : String?

    enum CodingKeys: String, CodingKey {

        case name = "name"
        case pictureUrl = "pictureUrl"
        case character = "character"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        pictureUrl = try values.decodeIfPresent(String.self, forKey: .pictureUrl)
        character = try values.decodeIfPresent(String.self, forKey: .character)
    }

}
