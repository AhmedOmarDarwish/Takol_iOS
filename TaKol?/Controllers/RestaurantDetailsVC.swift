//
//  RestaurantDetailsVC.swift
//  TaKol?
//
//  Created by 3Mr on 8/4/19.
//  Copyright © 2019 3Mr. All rights reserved.
//

import UIKit
import SDWebImage
import Cosmos

class RestaurantDetailsVC: UIViewController {
    @IBOutlet weak var restaurantImage_iv: UIImageView!
    @IBOutlet weak var ratingStar: CosmosView!
    var restaurant: Restaurant!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = restaurant.name
        restaurantImage_iv.sd_setImage(with: restaurant.r_image)
        ratingStar.rating = 3.5
    }
    
    
}
