//
//  AddressCell.swift
//  TaKol?
//
//  Created by 3Mr on 7/22/19.
//  Copyright © 2019 3Mr. All rights reserved.
//

import UIKit

class AddressCell: UITableViewCell {

    @IBOutlet weak var address_tf: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(address: String){
        self.address_tf.text = address
    }
    
}
