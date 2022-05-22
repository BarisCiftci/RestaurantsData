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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetail" {
            let destination = segue.destination as! DetailViewController
            let selectedIndexPath = tableView.indexPathForSelectedRow!
            
            let selectedRestaurant = restaurants.restaurantArray[selectedIndexPath.row]
            destination.restaurantItem = selectedRestaurant
        }
    }
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.restaurantArray.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let selectedRestaurant = restaurants.restaurantArray[indexPath.row]
        let selectedRestaurantStatus = selectedRestaurant.status
        
        cell.textLabel?.text = selectedRestaurant.name
        cell.detailTextLabel?.text = selectedRestaurantStatus
        cell.imageView?.image = UIImage(named: "statusClosed")
        
        setStatusImageViewColor(selectedRestaurantStatus, cell)
        
        return cell
    }
    
    fileprivate func setStatusImageViewColor(_ selectedRestaurantStatus: String?, _ cell: UITableViewCell) {
        
        if selectedRestaurantStatus == "open"{
            cell.imageView?.image = UIImage(named: "statusOpen")
        } else if selectedRestaurantStatus == "closed" {
            cell.imageView?.image = UIImage(named: "statusClosed")
        } else {
            cell.imageView?.image = UIImage(named: "StatusOrderAhead")
        }
    }
}
