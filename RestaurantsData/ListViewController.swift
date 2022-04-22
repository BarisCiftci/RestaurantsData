//
//  ViewController.swift
//  RestaurantsData
//
//  Created by Baris Ciftci on 21/04/2022.
//

import UIKit

class ListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var restaurants = Restaurants()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        restaurants.getData {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.restaurantArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = restaurants.restaurantArray[indexPath.row].name
        cell.detailTextLabel?.text = restaurants.restaurantArray[indexPath.row].status
        return cell
        
    }
    
    
}
