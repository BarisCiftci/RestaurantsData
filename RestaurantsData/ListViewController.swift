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
            destination.nameItem = restaurants.restaurantArray[selectedIndexPath.row]
            destination.statusItem = restaurants.restaurantArray[selectedIndexPath.row]
            destination.sortingValuesItem = restaurants.restaurantArray[selectedIndexPath.row].sortingValues
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
        cell.imageView?.image = UIImage(named: "statusClosed")
        
        //toDo: update logic
        if restaurants.restaurantArray[indexPath.row].status == "open"{
           cell.imageView?.image = UIImage(named: "statusOpen")
        } else if restaurants.restaurantArray[indexPath.row].status == "closed" {
            cell.imageView?.image = UIImage(named: "statusClosed")
        } else {
            cell.imageView?.image = UIImage(named: "StatusOrderAhead")
        }

        return cell
        
    }
    
    
}
