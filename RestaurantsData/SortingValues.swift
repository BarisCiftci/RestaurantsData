//
//  SortingValues.swift
//  RestaurantsData
//
//  Created by Baris Ciftci on 23/04/2022.
//

import Foundation

struct SortingValues: Codable {
    var bestMatch: Double
    var newest: Double
    var ratingAverage: Double
    var distance: Int
    var popularity: Double
    var averageProductPrice: Int
    var deliveryCosts: Int
    var minCost: Int
    
}

var sortingValuesArray: [SortingValues] = []



extension SortingValues: CustomStringConvertible {
    var description: String {
        "\(bestMatch)"
    }
    
}
 
