//
//  RestaurantsTableVC.swift
//  TaKol?
//
//  Created by 3Mr on 8/1/19.
//  Copyright © 2019 3Mr. All rights reserved.
//

import UIKit

class RestaurantsTableVC: UITableViewController {
    let cellReuseIdentifier = "RestaurantCell"
    var restaurantsData: [Restaurant] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UINib.init(nibName: cellReuseIdentifier, bundle: nil), forCellReuseIdentifier: cellReuseIdentifier)
        self.tableView.dataSource = self
        self.tableView.delegate = self
        //Get All Restaurants
        APIManager.getRestaurants{(error, restaurantsData) in
            if let error = error {
                self.showAlert(title: "Sorry ", message: error)
            } else if let restaurantsData = restaurantsData {
                self.restaurantsData = restaurantsData
                self.tableView.reloadData()
            }
            
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return restaurantsData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let restaurantCell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! RestaurantCell
        let restaurant = restaurantsData[indexPath.row]
        restaurantCell.configureCell(restaurant)
        return restaurantCell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let restaurant = restaurantsData[indexPath.row]
        let restaurantDetailsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RestaurantDetailsVC") as! RestaurantDetailsVC
        restaurantDetailsVC.restaurant = restaurant
        //Push
        self.navigationController?.pushViewController(restaurantDetailsVC, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    
    
}
