//
//  DetailViewController.swift
//  RestaurantsData
//
//  Created by Baris Ciftci on 22/04/2022.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var restaurantsNameLabel: UILabel!
    @IBOutlet weak var bestMatchLabel: UILabel!
    @IBOutlet weak var newestLabel: UILabel!
    @IBOutlet weak var ratingAverageLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var popularityLabel: UILabel!
    @IBOutlet weak var averageProductPriceLabel: UILabel!
    @IBOutlet weak var deliveryCostsLabel: UILabel!
    @IBOutlet weak var minCostLabel: UILabel!
    
    var restaurantItem: Restaurant!
    var sortingValuesItem: SortingValues!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sortingValuesItem = restaurantItem.sortingValues
        
        setLabelsText()
        updateStatusColor()
    }
    
    func setLabelsText() {
        statusLabel.text = restaurantItem.status?.uppercased()
        restaurantsNameLabel.text = restaurantItem.name
        bestMatchLabel.text = sortingValuesItem.bestMatch.description
        newestLabel.text = sortingValuesItem.newest.description
        ratingAverageLabel.text = sortingValuesItem.ratingAverage.description
        distanceLabel.text = sortingValuesItem.distance.description
        popularityLabel.text = sortingValuesItem.popularity.description
        averageProductPriceLabel.text = sortingValuesItem.averageProductPrice.description
        deliveryCostsLabel.text = sortingValuesItem.deliveryCosts.description
        minCostLabel.text = sortingValuesItem.minCost.description
        
    }
    
    func updateStatusColor() {
        if restaurantItem.status == "open" {
            statusLabel.textColor = .systemGreen
        } else if restaurantItem.status == "closed" {
            statusLabel.textColor = .systemRed
        } else {
            statusLabel.textColor = .systemOrange
        }
    }
    
}
