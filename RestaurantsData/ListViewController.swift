//
//  ViewController.swift
//  RestaurantsData
//
//  Created by Baris Ciftci on 21/04/2022.
//

import UIKit

class ListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var restaurants = ["Swifty Sunrise", "Balsdwin at the Beach", "Eagle Eggnog"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = restaurants[indexPath.row]
        cell.detailTextLabel?.text = "_"
        return cell
        
    }
    
    
}
