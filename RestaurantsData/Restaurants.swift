//
//  Restaurants.swift
//  RestaurantsData
//
//  Created by Baris Ciftci on 22/04/2022.
//

import Foundation

class Restaurants {
    
    struct Returned: Codable {
        var restaurants: [Restaurant]
    }
    
    struct Restaurant: Codable {
        var name = ""
        var status = ""
    }
    
    let urlString = "https://raw.githubusercontent.com/ercanduman/VisualizeRestaurants/master/app/src/main/assets/sample_android.json"
    var restaurantArray: [Restaurant] = []
    
    func getData(completed: @escaping ()->()) {
        print("We are accesing the url \(urlString)")
        
        // create url
        guard let url = URL(string: urlString) else {
            print("ERROR: Could not create a URL from \(urlString)")
            completed()
            return
            
        }
        
        // create session
        let session = URLSession.shared
        
        // get data with .dataTask method
        let task =  session.dataTask(with: url) { data, response, error in
            if let error = error {
                print("!!!ERROR: \(error.localizedDescription)")
            }
            
            // deal woth data
            do {
                let returned = try JSONDecoder().decode(Returned.self, from: data!)
                self.restaurantArray = returned.restaurants
                
            } catch {
                print("!!!JSON ERROR: \(error.localizedDescription)")
                
            }
            completed()
        }
        task.resume()
    }
}
