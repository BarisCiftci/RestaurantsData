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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
