//
//  RestaurantCell.swift
//  TaKol?
//
//  Created by 3Mr on 8/1/19.
//  Copyright © 2019 3Mr. All rights reserved.
//

import UIKit
import SDWebImage


class RestaurantCell: UITableViewCell {
    @IBOutlet weak var resturantImage_iv: UIImageView!
    @IBOutlet weak var restaurantName_lbl: UILabel!
    @IBOutlet weak var resturantDescription_lbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configureCell(_ restaurant: Restaurant){
        self.restaurantName_lbl.text = restaurant.name
        self.resturantDescription_lbl.text = restaurant.r_description
        self.resturantImage_iv.sd_setImage(with: restaurant.r_image)
        
    }
    
}
