//
//  PopulationModel.swift
//  MVP-API-Demo
//
//  Created by Lana Fernando S on 24/04/22.
//

import Foundation

class PopulationModel: Decodable {
    
    let id: String?
    let nation: String?
    let idYear: Int?
    let year: String?
    let population: Int?
    let slugNation: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "ID Nation"
        case nation = "Nation"
        case id_year = "ID Year"
        case year = "Year"
        case population = "Population"
        case slugNation = "Slug Nation"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(String.self, forKey: .id)
        self.nation = try container.decodeIfPresent(String.self, forKey: .nation)
        self.idYear = try container.decodeIfPresent(Int.self, forKey: .id_year)
        self.year = try container.decodeIfPresent(String.self, forKey: .year)
        self.population = try container.decodeIfPresent(Int.self, forKey: .population)
        self.slugNation = try container.decodeIfPresent(String.self, forKey: .slugNation)
    }
    
}
