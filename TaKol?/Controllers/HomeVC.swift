//
//  HomeVC.swift
//  TaKol?
//
//  Created by 3Mr on 7/29/19.
//  Copyright © 2019 3Mr. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Change NavigationItem Title
        self.navigationItem.title = "Home"
    }
    @IBAction func settingBtnPressed(_ sender: Any) {
        let settingVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SettingVC") as! SettingVC
        //Push
        self.navigationController?.pushViewController(settingVC, animated: true)
    }
    @IBAction func ourRestaurantsBtnPressed(_ sender: Any) {
        let restaurantsTableVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RestaurantsTableVC") as! RestaurantsTableVC
        //Push
        self.navigationController?.pushViewController(restaurantsTableVC, animated: true)
    }
    
}
